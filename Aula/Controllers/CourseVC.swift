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
    override func viewDidLoad() {
        super.viewDidLoad()
        courseTableView.alpha = 0.0
        noCoursesFoundView.alpha = 1.0
        configUI()
        // Do any additional setup after loading the view.
    }

}

//MARK: UI Methods
extension CourseVC {
    func configUI() {
       configAccordingToCourses()
    }
    
    func configAccordingToCourses() {
        guard let user = Auth.auth().currentUser else {return}
         FirebaseHelper
            .shared
            .coursesRef
            .queryOrdered(byChild: "creater")
            .queryEqual(toValue: user.uid).observe(.value) { [unowned self] (snapshot) in
                print(snapshot.value)
                if snapshot.hasChildren() {
                    self.courseTableView.alpha = 1.0
                    self.noCoursesFoundView.alpha = 0.0
                } else {
                    self.courseTableView.alpha = 0.0
                    self.noCoursesFoundView.alpha = 1.0
                }
        }
    }
}

extension CourseVC {
    
}


//MARK: TableView Methods
extension CourseVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let courseCell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseCell
        return courseCell
    }
}
