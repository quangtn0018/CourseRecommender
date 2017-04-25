//
//  RecCoursesTableViewController.swift
//  CourseRec
//
//  Created by Quang Nguyen on 4/22/17.
//  Copyright © 2017 Quang Nguyen. All rights reserved.
//

import UIKit

class RecCoursesTableViewController: UITableViewController {

    // MARK: Constants
    let showCourseDetailFromRecCourses = "ShowCourseDetailFromRecCourses"
    
    // MARK: Properties
    var userCourses = [Course]()
    var recCourses = [Course]()
    var recCoursesGraph = RecCoursesGraph()
    var cellDidSelectIndex: IndexPath = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recCourses = recCoursesGraph.getRecCourses(uCourses: userCourses)
    }

    // MARK: IBAction
    @IBAction func backToUserDisplaySceneButtonTouched(_ sender: Any) {
            dismiss(animated: true, completion: nil)
    }

    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showCourseDetailFromRecCourses {
            let destNavController: UINavigationController = segue.destination as! UINavigationController
            let targetController = destNavController.topViewController as! CourseDetailTableViewController
            targetController.courseToDisplay = recCourses[cellDidSelectIndex.row]
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recCourses.count
    }

    func disableSelectionStyleForCell(cell :UITableViewCell) {
        cell.selectionStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        cellDidSelectIndex = indexPath
        performSegue(withIdentifier: showCourseDetailFromRecCourses, sender: self)
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecCoursesCell", for: indexPath)

        let course = recCourses[indexPath.row]
        cell.textLabel?.text = course.name
        cell.detailTextLabel?.text = course.title
        cell.accessoryType = .detailButton
        disableSelectionStyleForCell(cell: cell)
        return cell
    }

    
    
}


