//
//  CourseVC.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import Firebase
class CourseVC: UIViewController {

    @IBOutlet weak var noCoursesFoundView: UIStackView!
    @IBOutlet weak var courseTableView: UITableView!
    var courses = [Course]() {
        didSet {
            courseTableView.reloadData()
            if courses.count > 0 {
                courseTableView.alpha = 1.0
                noCoursesFoundView.alpha = 0.0
            } else {
                courseTableView.alpha = 0.0
                noCoursesFoundView.alpha = 1.0
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }

}

//MARK: UI Methods
extension CourseVC {
    func configUI() {
       configAccordingToCourses()
    }
    
    func configAccordingToCourses() {
        FirebaseHelper.shared.enrolledCourseRef?.observe(.value, with: { [weak self] (snapshot) in
            if let dict = snapshot.value as? [String:[String:String]] {
                var tempCourses = [Course]()
                for courseDict in dict.values {
                    tempCourses.append(Course(json: courseDict))
                }
                self?.courses = tempCourses
            }

        })
    }
}


//MARK: IBActions
extension CourseVC {
    @IBAction func addCourseButtonTapped(_ sender:UIButton) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SelectCourseVC") as! SelectCourseVC
        controller.selectedCourses =  courses
        present(controller, animated: true, completion: nil)
    }
}


//MARK: TableView Methods
extension CourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let courseCell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseCell
        courseCell.course = courses[indexPath.row]
        return courseCell
    }
}

extension CourseVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let topicVC = storyboard?.instantiateViewController(withIdentifier: "TopicVC") as! TopicVC
        navigationController?.pushViewController(topicVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
