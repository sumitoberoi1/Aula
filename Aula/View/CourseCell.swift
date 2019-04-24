//
//  CourseCell.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import SwiftDate
class CourseCell: UITableViewCell {

    @IBOutlet weak var classTimeLabel: UILabel!
    @IBOutlet weak var instructorNameLabel: UILabel!
    @IBOutlet weak var courseNameLabel: UILabel!
    
    var course:Course? {
        didSet {
            refreshUI()
        }
    }
    
    func refreshUI() {
        if let course = course {
            courseNameLabel.text = "\(course.courseName)(\(course.courseCode))"
            instructorNameLabel.text = "Prof. \(course.instructorName)"
            classTimeLabel.text = course.timings
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
