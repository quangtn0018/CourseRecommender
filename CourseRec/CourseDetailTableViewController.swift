//
//  CourseDetailTableViewController.swift
//  CourseRec
//
//  Created by Quang Nguyen on 3/23/17.
//  Copyright © 2017 Quang Nguyen. All rights reserved.
//

import UIKit

class CourseDetailTableViewController: UITableViewController {    
    
    // MARK: Properties
    var courseToDisplay: Course = Course()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disableScrollingForTableView()
    }
    
    func disableScrollingForTableView() {
        // disable scrolling in UITableView table when the content fits on the screen
        tableView.alwaysBounceVertical = false
    }
    
    
    // MARK: IBACtion
    @IBAction func goBackToCoursesToAddSceneButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseDetailCell", for: indexPath) as! CourseDetailViewCell
        
        disableTouchForCell(cell: cell)
        setLabelProperties(cell: cell)
        setContentsToCell(cell: cell)
    
        return cell
    }
    
    func setContentsToCell(cell: CourseDetailViewCell) {
        cell.courseNameLabel.text = courseToDisplay.name
        cell.courseTitleLabel.text = courseToDisplay.title
        cell.unitsLabel.text = cell.unitsLabel.text! + courseToDisplay.units
        cell.prereqTextView.text = courseToDisplay.prereq
        cell.descriptTextView.text = courseToDisplay.descript
    }
    
    func disableTouchForCell(cell :CourseDetailViewCell) {
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = false
    }
    
    func setLabelProperties(cell: CourseDetailViewCell) {
        cell.courseNameLabel.textColor = UIColor.red
        cell.courseTitleLabel.textColor = UIColor.red
        cell.unitsLabel.font = UIFont.italicSystemFont(ofSize: cell.unitsLabel.font.pointSize)
        cell.prereqLabel.font = UIFont.boldSystemFont(ofSize: cell.prereqLabel.font.pointSize)
        cell.descriptLabel.font = UIFont.boldSystemFont(ofSize: cell.descriptLabel.font.pointSize)
    }

}
