//
//  FindCoursesTableViewController.swift
//  CourseRec
//
//  Created by Quang Nguyen on 3/21/17.
//  Copyright © 2017 Quang Nguyen. All rights reserved.
//

import UIKit
import Firebase


class FindCoursesTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    // MARKK: Constants
    let searchController = UISearchController(searchResultsController: nil)
    let cellId = "FindCoursesViewCell"
    let showCourseDetail = "ShowCourseDetail"
    
    // MARK: Properties
    var courses = [Course]()
    var filteredCourses = [Course]()
    var coursesDict: [String: Course] = [:]
    var cellDidSelectIndex: IndexPath = IndexPath()
    var selectedCourseDictToSave: [String: Course] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         * for the "Attempting to load the view of
         * a view controller while it is deallocating is
         * not allowed and may result in
         * undefined behavior (<UISearchController) Error"
         */
        self.searchController.loadViewIfNeeded()
        
        
        courses = Course.generateCSCoursesArray()
        coursesDict = Course.generateCSCoursesDictionary()
        
        
        setUISearchController()
        tableView.reloadData()
        
        
        
    }
    
    // MARK: Func
    func setUISearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showCourseDetail {
            let destNavController: UINavigationController = segue.destination as! UINavigationController
            let targetController = destNavController.topViewController as! CourseDetailTableViewController
            let currentCell = tableView.cellForRow(at: cellDidSelectIndex)
            targetController.courseToDisplay = coursesDict[(currentCell?.textLabel?.text)!]!
        }
    }
    
    // MARK: UISearchResultsUpdating protocol
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredCourses = courses.filter { course in
            // search for course name or course title
            return course.name.lowercased().contains(searchText.lowercased()) || course.title.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    // MARK: IBActions
    @IBAction func backToUserDisplaySceneButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveCoursesButtonTouched(_ sender: Any) {
        
        // TODO
        // future versions - implemeent >= 1 course was selected
        // pseudocode:
        // get selected courses
        // maybe: using a Set Data Structure
        // for right now: using selected courses Dictionary to save selected courses
        
        // add selected classes into Firebase DB for current user
        let user = FIRAuth.auth()?.currentUser
        
        guard let uid = user?.uid else {
            return
        }
        
        let rootRef = FIRDatabase.database().reference()
        let userRef = rootRef.child("users").child(uid)
        let courseRef = userRef.child("courses")
        
        /*
         var allCoursesAdded: Bool = true
         var coursesNotAddedMessage = "Courses Already Exist In Your File, Not Adding:\n"
         var coursesAddedMessage = "Courses Added:\n"
         */
        
        
        // if >= 1 course was selected, go back to UserTableViewController
        // if courses already exist in Firebase DB,
        // prompt UIAlert or PopUp saying "course already exist"
        
        // ISSUE
        // Firebase loads and synchronizes data asynchronously
        // so code after data base loads will complete before firebase finish loading
        // need to fix this
        // for now, just adding courses to Firebase DB, even if it exists in DB already
        if selectedCourseDictToSave.count > 0 {
            
            // loop through each course in selected course array and add it to Firebase DB
            
            // key = courseName, val = Course()
            for (_, val) in selectedCourseDictToSave {
                courseRef.observeSingleEvent(of: .value, with: { (snapshot) in
                    self.coursesDict[val.name]?.selectedForAdding = false
                    if snapshot.hasChild(val.name) {
                        print("course exist in DB")
                        // allCoursesAdded = false
                        // coursesNotAddedMessage.append(val.name + "\n")
                        // print("inside of for loop, allCoursesAdded: ", allCoursesAdded)
                    } else {
                        print("course doesn't exist")
                        let courseChildRef = courseRef.child(val.name)
                        let values = ["name": val.name, "title": val.title, "descript": val.descript, "prereq": val.prereq, "units": val.units]
                        courseChildRef.updateChildValues(values) { (error, rootRef) in
                            if error !=  nil {
                                print(error as Any)
                                return
                            }
                            print("successfully added course to Firebase DB")
                            // coursesAddedMessage.append(val.name + "\n")
                        }
                    }
                })
                
                
                
            }
            
            
            var alertMessage = "Selected Courses Added"
            
            /*
             print("outside of for loop, allCoursesAdded: ", allCoursesAdded)
             
             if allCoursesAdded {
             alertMessage = "All Selected Courses Added"
             } else {
             alertMessage = coursesNotAddedMessage + coursesAddedMessage
             print("in allCoursesAdded == false")
             print("alertMessage: ", alertMessage)
             }
             */
            let alert = UIAlertController(title: "Alert", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
            
            
            //            dismiss(animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Alert", message: "No Courses Were Selected", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredCourses.count
        }
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let course: Course
        
        if searchController.isActive && filteredCourses.count > indexPath.row {
            course = filteredCourses[indexPath.row]
        } else {
            course = courses[indexPath.row]
        }
        
        cell.textLabel?.text = course.name
        cell.detailTextLabel?.text = course.title
        
        
        if (coursesDict[course.name]?.selectedForAdding)! {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .detailButton
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        // segue into view controller to display detail of course
        cellDidSelectIndex = indexPath
        performSegue(withIdentifier: showCourseDetail, sender: self)
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // FIX - using reusuablecell so checkmarks overlap
        // RESOLVED - create a property "selectedForAdding"
        let cell = tableView.cellForRow(at: indexPath)
        let courseName = cell?.textLabel?.text
        coursesDict[courseName!]?.selectedForAdding = !(coursesDict[courseName!]?.selectedForAdding)!
        if (coursesDict[courseName!]?.selectedForAdding)! {
            selectedCourseDictToSave[courseName!] = coursesDict[courseName!]
        } else {
            selectedCourseDictToSave.removeValue(forKey: courseName!)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
}




