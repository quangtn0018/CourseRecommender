//
//  UserTableViewController.swift
//  CourseRec
//
//  Created by Quang Nguyen on 3/20/17.
//  Copyright © 2017 Quang Nguyen. All rights reserved.
//

import UIKit
import Firebase

class UserTableViewController: UITableViewController {

    // MARK: Constants
    let showCourseDetailFromUser = "ShowCourseDetailFromUser"
    let showRecCoursesFromUser = "ShowRecCoursesFromUser"
    
    // MARK: Properties
    var userCourses = [Course]()
    var courseToSendToSegue = Course()
    var cellDidSelectIndex: IndexPath = IndexPath()
    var coursesGraph = RecCoursesGraph()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        setToolbar()
        fetchUserCourses()
//        observeUserCourses()
        // for delete cell function
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    // TODO
    // fix to delete from Firebase DB and not the app
    // it will crash because deleting twice,
    // observeUserCourses will get called (first delete in array), then editingStyle for second delete in array
    func observeUserCourses() {
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {
            return
        }
        
        let ref = FIRDatabase.database().reference().child("users").child(uid).child("courses")
        
        ref.observe(.childRemoved, with: { (snapshot) in
            // TODO
            // need to change this, time complexity is at least O(n)
            // maybe: use a dictionary
            // for now, looping through array to find Course and removing it
            // too slow
            
            print(snapshot)
            
            var index = 0
            for i in 0..<self.userCourses.count {
                if self.userCourses[i].name == snapshot.key {
                    index = i
                    break
                }
            }
            self.userCourses.remove(at: index)
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
            
        }, withCancel: nil)
    }
    
    func fetchUserCourses() {
        
        let user = FIRAuth.auth()?.currentUser
        
        guard let uid = user?.uid else {
            return
        }
        
        let rootRef = FIRDatabase.database().reference()
        let userRef = rootRef.child("users").child(uid)
        let courseRef = userRef.child("courses")
        
        courseRef.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let course = Course()
                // if you use this setter, your app will crash if your class properties don't exactly match up with the Firebase dictionary keys
            
                // setVluesForKeys comes from subclassing NSObject in Course class
                // ex class Course: NSObject {}
//                course.setValuesForKeys(dictionary)
                
                course.name = dictionary["name"] as! String
                course.title = dictionary["title"] as! String
                course.descript = dictionary["descript"] as! String
                course.prereq = dictionary["prereq"] as! String
                course.units = dictionary["units"] as! String
                
                self.userCourses.append(course)

                // this will crash because of background thread, so fix with dispatchqueue
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
//                print("successfully loaded courses from Firebase DB")
            }
            
        }, withCancel: nil)
    }
    
    // commented out: - because AppDelegate handles all UINavBar Viewcontroler changes
    /*
    override func viewDidAppear(_ animated: Bool) {
        // change UINavigationBar of this ViewController
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.blackTranslucent
        nav?.tintColor = UIColor.orange
    }
    */
    
    func disableSelectionStyleForCell(cell :UITableViewCell) {
        cell.selectionStyle = .none
    }
    
    func setToolbar() {
        self.navigationController?.isToolbarHidden = false
        let navToolbar = self.navigationController?.toolbar
//        navToolbar?.barTintColor = UIColor.red
//        navToolbar?.tintColor = UIColor.white
    }
    
    func checkIfUserIsLoggedIn() {
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
    }
    
    func handleLogout() {
        try! FIRAuth.auth()!.signOut()
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        cellDidSelectIndex = indexPath
        performSegue(withIdentifier: showCourseDetailFromUser, sender: self)
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showCourseDetailFromUser {
            let destNavController: UINavigationController = segue.destination as! UINavigationController
            let targetController = destNavController.topViewController as! CourseDetailTableViewController
            targetController.courseToDisplay = userCourses[cellDidSelectIndex.row]
        } else if segue.identifier == showRecCoursesFromUser {
            let destNavController: UINavigationController = segue.destination as! UINavigationController
            let targetController = destNavController.topViewController as! RecCoursesTableViewController
            targetController.userCourses = userCourses
        }
    }
    
    @IBAction func logoutButtonTouch(_ sender: Any) {
        handleLogout()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCourses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCoursesCell", for: indexPath)
        // display courses from Firebase DB
        let course = userCourses[indexPath.row]
        cell.textLabel?.text = course.name
        cell.detailTextLabel?.text = course.title
        cell.accessoryType = .detailButton
        disableSelectionStyleForCell(cell: cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            guard let uid = FIRAuth.auth()?.currentUser?.uid else {
                return
            }
            
            let courseName = userCourses[indexPath.row].name
            
            FIRDatabase.database().reference().child("users").child(uid).child("courses").child(courseName).removeValue(completionBlock: { (error, ref) in
                if error != nil {
                    print("failed to delete course", error as Any)
                    return
                }
                
                print(self.userCourses.count)
                print("forRowAt indexPath: ", indexPath.row)
                
                // TODO
                // need to change this, time complexity is at least O(n)
                // maybe: use a dictionary
                self.userCourses.remove(at: indexPath.row)
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            })
            
            
        }
    }
    
    
    
    
    

}
