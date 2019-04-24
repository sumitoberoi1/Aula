//
//  SelectCourseVC.swift
//  Aula
//
//  Created by sumit oberoi on 4/24/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class SelectCourseVC: UIViewController {

    @IBOutlet weak var courseTableView: UITableView!
    
    var selectedCourses = [Course]() {
        didSet {
            courseTableView.reloadData()
        }
    }
    var courses = [Course]() {
        didSet {
            courseTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    

}

private extension SelectCourseVC {
    @IBAction func doneButtonTapped(_ sender:UIButton) {
        if selectedCourses.count > 0 {
            if let enrolledCourses = FirebaseHelper.shared.enrolledCourseRef {
                for course in selectedCourses {
                    let courseDict = ["CourseCode":course.courseCode,
                                      "Professor":course.instructorName,
                                      "Timings":course.timings,
                                      "courseName":course.courseName]
                    enrolledCourses.setValue(["\(course.courseCode)":courseDict])
                }
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: Data Methods
extension SelectCourseVC {
    func fetchData() {
        FirebaseHelper.shared.coursesRef.observeSingleEvent(of: .value) { (snapshot) in
            if let snapVal = snapshot.value as? [String:[String:String]] {
                var tempCourses = [Course]()
                for (_,val) in snapVal {
                  tempCourses.append(Course(json: val))
                }
                self.courses = tempCourses
            }
        }
    }
}

extension SelectCourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selCourseCell = tableView.dequeueReusableCell(withIdentifier: "SelectCourseCell", for: indexPath) as! SelectCourseCell
        let course = courses[indexPath.row]
        if selectedCourses.contains(course) {
            selCourseCell.selCourseButton.isSelected = true
        } else {
            selCourseCell.selCourseButton.isSelected = false
        }
        selCourseCell.course = course
        return selCourseCell
    }
}

extension SelectCourseVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let course = courses[indexPath.row]
        if selectedCourses.contains(course) {
            if let index = selectedCourses.firstIndex(of: course),
                index >= 0 {
                selectedCourses.remove(at: index)
            }
        } else {
            selectedCourses.append(course)
        }
    }
}
