//
//  CourseDetailViewCell.swift
//  CourseRec
//
//  Created by Quang Nguyen on 3/24/17.
//  Copyright © 2017 Quang Nguyen. All rights reserved.
//

import UIKit

class CourseDetailViewCell: UITableViewCell {

    @IBOutlet weak var prereqTextView: UITextView!
    @IBOutlet weak var descriptTextView: UITextView!
    @IBOutlet weak var unitsLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseTitleLabel: UILabel!
    @IBOutlet weak var prereqLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
