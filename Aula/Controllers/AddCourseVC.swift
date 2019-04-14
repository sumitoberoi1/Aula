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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        course.observe(.value) { (data) in
            print(data.value)
        }
        //course.ref.updateChildValues(["courseCode":"CS554"])
        // Do any additional setup after loading the view
    }

    
    
}


//MARK: Actions
extension AddCourseVC {
    @IBAction func addCourseButtonTapped(_ sender: UIButton) {
       let newChildRef = course.ref.childByAutoId()
        newChildRef.setValue(["courseCode":courseCodeTextField.text!, "courseName":courseNameTextField.text!])
    }
}
