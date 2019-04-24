//
//  SelectCourseCell.swift
//  Aula
//
//  Created by sumit oberoi on 4/24/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class SelectCourseCell: CourseCell {

    @IBOutlet weak var selCourseButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
