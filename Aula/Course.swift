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
    let id:String
    let createrUId:String
    let courseCode:String
    let courseName:String
    let startTime:Date?
    let endTime:Date?
    let instructorName:String
    init(id:String, createrUId:String,courseCode:String, courseName:String,startTime:String, endTime:String, instructorName:String) {
        self.id = id
        self.createrUId = createrUId
        self.courseCode = courseCode
        self.courseName = courseName
        self.startTime = startTime.toDate("H:mm a", region: Region.current)?.date
        self.endTime = endTime.toDate("H:mm a", region: Region.current)?.date
        self.instructorName = instructorName
    }
   
}
