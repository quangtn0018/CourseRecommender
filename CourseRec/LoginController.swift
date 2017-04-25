//
//  LoginController.swift
//  CourseRec
//
//  Created by Quang Nguyen on 3/9/17.
//  Copyright © 2017 Quang Nguyen. All rights reserved.
//

import UIKit
import Firebase
import Lottie

class LoginController: UIViewController {
    
    // MARK: Constants
    let loginToHome = "LoginToHome"
    
    // MARK: Outlets
    @IBOutlet weak var loginSelector: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var forgotPasswordStackView: UIStackView!
    
    // MARK: Properties
    var isLogIn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLottieAnimation()
        setBackground()
        setLoginButton()
    }
    
    func setLottieAnimation() {
        let animationView = LOTAnimationView(name: "PinJump")
        animationView?.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 200)
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopAnimation = true
        self.view.addSubview(animationView!)
        animationView?.play()
        // TODO
        // need to allow user to see login button with keyboard visible
    }
    
    // MARK: IBActions
    @IBAction func loginSelectorChanged(_ sender: Any) {
        isLogIn = !isLogIn
        
        if isLogIn {
            loginButton.setTitle("Log In", for: .normal)
            forgotPasswordStackView.isHidden = false
        } else {
            loginButton.setTitle("Register", for: .normal)
            forgotPasswordStackView.isHidden = true
        }
    }
    
    @IBAction func loginButtonTouch(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("not a valid form of email or password")
            return
        }
        
        if isLogIn {
            // auth user
            handleAuth(email: email, password: password)
        } else {
            // register user
            handleRegister(email: email, password: password)
        }
    }
    
    @IBAction func resetPasswordButtonTouch(_ sender: Any) {
        guard let email = emailTextField.text else {
            print("not a valid form of email")
            return
        }
        handleResetPassword(email: email)
    }
    
    // MARK: Func
    func setLoginButton() {
        loginButton.layer.cornerRadius = 6
    }
    
    func setBackground() {
        self.view.backgroundColor = UIColor.white
    }
    
    func handleResetPassword(email: String) {
        FIRAuth.auth()?.sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                    switch errCode {
                    case .errorCodeUserNotFound:
                        self.errorMessageLabel.text = "Email does no exist"
                    case .errorCodeInvalidEmail:
                        self.errorMessageLabel.text = "Email form is invalid to send email"
                    default:
                        self.errorMessageLabel.text = "Enter email in email box"
                        print("Reset password Error: \(error!)")
                    }
                }
                self.errorMessageLabel.isHidden = false
                return
            }
            
            // TODO
            // send reset mail
            self.errorMessageLabel.text = "Reset email has been sent"
        }
    }
    
    func handleAuth(email: String, password: String) {
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if user == nil {
                print(error as Any)
                // handle error
                if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                    switch errCode {
                    case .errorCodeUserNotFound:
                        self.errorMessageLabel.text = "Email does no exist"
                    case .errorCodeInvalidEmail:
                        self.errorMessageLabel.text = "Email form is invalid"
                    case .errorCodeWrongPassword:
                        self.errorMessageLabel.text = "Wrong password. Please try again"
                    default:
                        print("Log In User Error: \(error!)")
                    }
                }
                self.errorMessageLabel.isHidden = false
                return
            }
                        
            self.prepareForUserTableViewSegue()
        })
    }
    
    func handleRegister(email: String, password: String) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, err) in
            
            if err != nil {
                print((err! as NSError).localizedDescription)
                
                // handle error
                if let errCode = FIRAuthErrorCode(rawValue: err!._code) {
                    switch errCode {
                    case .errorCodeEmailAlreadyInUse:
                        self.errorMessageLabel.text = "Email already exist"
                    case .errorCodeInvalidEmail:
                        self.errorMessageLabel.text = "Email form is invalid"
                    case .errorCodeWeakPassword:
                        self.errorMessageLabel.text = "Password must be 6 chars or more"
                    default:
                        print("Create User Error: \(err!)")
                    }
                }
                self.errorMessageLabel.isHidden = false
                return
            }
            
            // configure Firebase db
            guard let uid = user?.uid else {
                return
            }
            
            let rootRef = FIRDatabase.database().reference()
            let userRef = rootRef.child("users").child(uid)
            let values = ["email": email, "password": password]
            userRef.updateChildValues(values) { (error, rootRef) in
                if error !=  nil {
                    print(error as Any)
                    return
                }
                
//                print("successfully created user")
            }
            
            self.prepareForUserTableViewSegue()
        })
        
        
        
    }
    
    func prepareForUserTableViewSegue() {
        self.performSegue(withIdentifier: loginToHome, sender: self)
        self.clearTextFields()
    }
    
    func clearTextFields() {
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // dismiss keyboard when view is touched
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}

