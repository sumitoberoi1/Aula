//
//  Course.swift
//  Aula
//
//  Created by sumit oberoi on 4/14/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import Foundation
import SwiftDate

class Course {
    let courseCode:String
    let courseName:String
    let timings:String
    let instructorName:String
    init(courseCode:String, courseName:String,timings:String,instructorName:String) {
        self.courseCode = courseCode
        self.courseName = courseName
        self.timings = timings
        self.instructorName = instructorName
    }
    init(json:[String:String]) {
        self.courseCode = json["CourseCode"] ?? ""
        self.courseName = json["courseName"] ?? ""
        self.timings = json["Timings"] ?? ""
        self.instructorName = json["Professor"] ?? ""
    }
}

extension Course:Equatable {
    static func == (lhs: Course, rhs: Course) -> Bool {
        return lhs.courseCode == rhs.courseCode
    }
}
