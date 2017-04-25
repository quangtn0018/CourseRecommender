//
//  RecCoursesTableViewController.swift
//  CourseRec
//
//  Created by Quang Nguyen on 4/22/17.
//  Copyright © 2017 Quang Nguyen. All rights reserved.
//

import UIKit

class RecCoursesTableViewController: UITableViewController {

    // MARK: Properties
    var userCourses = [Course]()
    var recCourses = [String]()
    var recCoursesGraph = RecCoursesGraph()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recCourses = recCoursesGraph.getRecCourses(uCourses: userCourses)
    }

    // MARK: IBAction
    @IBAction func backToUserDisplaySceneButtonTouched(_ sender: Any) {
            dismiss(animated: true, completion: nil)
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecCoursesCell", for: indexPath)

        let courseName = recCourses[indexPath.row]
        cell.textLabel?.text = courseName
        disableSelectionStyleForCell(cell: cell)
        return cell
    }

    
    
}


