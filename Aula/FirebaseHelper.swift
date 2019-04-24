//
//  FirebaseHelper.swift
//  Aula
//
//  Created by sumit oberoi on 4/14/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import Foundation
import Firebase

class FirebaseHelper {
    static let shared = FirebaseHelper()
    var dbRef = Database.database().reference()
    var usersRef = Database.database().reference().ref.child("users")
    let coursesRef = Database.database().reference().ref.child("courses")
    var currentUserRef:DatabaseReference? {
        if let userID = Auth.auth().currentUser?.uid {
            return usersRef.child(userID)
        }
        return nil
    }
    var enrolledCourseRef:DatabaseReference? {
        if let currentUserRef = currentUserRef {
            return currentUserRef.child("enrolledCourses")
        }
        return nil
    }
    func writeCoursesToFirebase() {
        let courses = [
            "CS-545": [
                "courseName":"Human Computer Interaction",
                "Timings":"Monday 09:00-11:15 AM",
                "Professor":"Gregg Vesonder"
            ],
            "CS-503": [
                "courseName":"Discrete Math for Cryptography",
                "Timings":"Wednesday 06:30-09:00 PM",
                "Professor":"Suffel C"
            ],
            "CS-505":[
                "courseName":"Prob & Stochastic Proc I",
                "Timings":"Friday 12:00-02:30 PM",
                "Professor":"Tavassolian N"
            ],
            "CS-510":[
                "courseName":"Principles Programming Languages",
                "Timings":"Thursday 06:30-09:00PM",
                "Professor":"Bonelli E"
            ],
            "CS-511":[
                "courseName":"Principles Programming Languages",
                "Timings":"Monday 06:30-09:00PM",
                "Professor":"Bonelli E"
            ],
            "CS-513-A":[
                "courseName":"Knowledge Dis & Data Mining",
                "Timings":"Tuesday 12:30-03:00PM",
                "Professor":"Dehnad K"
            ],
            "CS-513-B":[
                "courseName":"Knowledge Dis & Data Mining",
                "Timings":"Wednesday 12:30-03:00PM",
                "Professor":"Dehnad K"
            ],
            "CS-514":[
                "courseName":"Computer Architecture",
                "Timings":"Tuesday 03:30-06:00PM",
                "Professor":"Peyrovian R"
            ],
            "CS-520":[
                "courseName":"Computer Architecture",
                "Timings":"Tuesday 06:30-09:00PM",
                "Professor":"Faynberg I"
            ],
            "CS-521":[
                "courseName":"TCP/IP Networking",
                "Timings":"Thursday 06:30-09:00PM",
                "Professor":"Rahman M"
            ]
        ]
        courses.forEach { [weak self] (arg0) in
            let (key, value) = arg0
            var dictToWrite = value
            dictToWrite["CourseCode"] = key
            self?.coursesRef.child(key).setValue(dictToWrite)
        }
    }
}
