//
//  SelectRoleVC.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import Firebase
class SelectRoleVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//MARK: IBActions
extension SelectRoleVC {
    @IBAction func studenTapped(_ sender: UIButton) {
        saveUserWithRole("student")
        navigateToCourse()
    }
    
    @IBAction func teacherTapped(_ sender: UIButton) {
        saveUserWithRole("teacher")
        navigateToCourse()
    }
    
}



//MARK: Firebase Methods
extension SelectRoleVC {
    func saveUserWithRole(_ role:String) {
        if let user = Auth.auth().currentUser {
            FirebaseHelper.shared.dbRef.child("users").child(user.uid).setValue(["role":role])
        }
    }
    private func navigateToCourse() {
        let courseVC = storyboard?.instantiateViewController(withIdentifier: "CourseVC") as! CourseVC
        navigationController?.pushViewController(courseVC, animated: true)
    }
}

