//
//  AddCourseVC.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import Firebase
import DateTimePicker
import SwiftDate

class AddCourseVC: UIViewController {
    @IBOutlet weak var instructorNametextField: CustomTextField!
    @IBOutlet weak var courseCodeTextField: CustomTextField!
    @IBOutlet weak var courseNameTextField: CustomTextField!
    @IBOutlet weak var endTimeTextField: CustomTextField!
    @IBOutlet weak var startTimeTextField: CustomTextField!
    let startTimePicker = DateTimePicker.create()
    let endTimePicker = DateTimePicker.create()
    var startTime:Date?
    var endTime:Date?
    override func viewDidLoad() {
        super.viewDidLoad()
        configTimePicker(startTimePicker)
        configTimePicker(endTimePicker)
        startTimeTextField.inputView = startTimePicker
        endTimeTextField.inputView = endTimePicker
    }

}


//MARK: UI Elements
extension AddCourseVC {
    func configTimePicker(_ dateTimePicker:DateTimePicker) {
        dateTimePicker.dateFormat = "h:mm a"
        dateTimePicker.highlightColor = UIColor(red: 154.0/255.0, green: 20.0/255.0, blue: 52.0/255.0, alpha: 1.0)
        dateTimePicker.isTimePickerOnly = true
        dateTimePicker.todayButtonTitle = "Reset"
        dateTimePicker.delegate = self
        dateTimePicker.doneBackgroundColor =  UIColor(red: 154.0/255.0, green: 20.0/255.0, blue: 52.0/255.0, alpha: 1.0)
    }
    
}
//MARK: Actions
extension AddCourseVC {
    @IBAction func addCourseButtonTapped(_ sender: UIButton) {
       saveCourse()
        navigationController?.popViewController(animated: true)
    }
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

//MARk: Firebase

extension AddCourseVC {
    func saveCourse() {
        guard let user = Auth.auth().currentUser else {return}
        let newChildRef = FirebaseHelper.shared.coursesRef.ref.childByAutoId()
        newChildRef.setValue(["courseCode":courseCodeTextField.text!, "courseName":courseNameTextField.text!,"instructorName":instructorNametextField.text!,"startTime":startTimeTextField.text!, "endTime":endTimeTextField.text!, "creater":user.uid])
    }
}

extension AddCourseVC:DateTimePickerDelegate {
    func dateTimePicker(_ picker: DateTimePicker, didSelectDate: Date) {
        //view.endEditing(true)
    }
    func dateTimePickerDoneTapped(_ picker: DateTimePicker, didSelectDate date: Date) {
        if picker == startTimePicker {
            startTime = date
            self.startTimeTextField.text = date.convertTo(region: Region.current).toFormat("h:mm a")
        } else if picker == endTimePicker {
            endTime = date
            self.endTimeTextField.text = date.convertTo(region: Region.current).toFormat("h:mm a")
        }
        view.endEditing(true)
    }
    func closeDateTimePicker(_ picker:DateTimePicker) {
        view.endEditing(true)
    }
}
