//
//  AddCourseVC.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import Firebase
let course = Database.database().reference(withPath: "course")
class AddCourseVC: UIViewController {
    @IBOutlet weak var courseCodeTextField: CustomTextField!
    @IBOutlet weak var courseNameTextField: CustomTextField!
    @IBOutlet weak var endTimeTextField: CustomTextField!
    @IBOutlet weak var startTimeTextField: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
}


//MARK: Actions
extension AddCourseVC {
    @IBAction func addCourseButtonTapped(_ sender: UIButton) {
       saveCourse()
        navigationController?.popViewController(animated: true)
    }
}

//MARk: Firebase

extension AddCourseVC {
    func saveCourse() {
        guard let user = Auth.auth().currentUser else {return}
        let newChildRef = FirebaseHelper.shared.coursesRef.ref.childByAutoId()
        newChildRef.setValue(["courseCode":courseCodeTextField.text!, "courseName":courseNameTextField.text!, "startTime":startTimeTextField.text!, "endTime":endTimeTextField.text!, "creater":user.uid])
    }
}
