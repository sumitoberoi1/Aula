//
//  ViewController.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import Firebase
import ALRT
class LoginVC: UIViewController {
    @IBOutlet weak var userEmailTextField: CustomTextField!
    @IBOutlet weak var userPasswordTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

//MARK: IBActions

extension LoginVC {
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        login()
    }
}

//MARK: FireBase Methods
extension LoginVC {
    func login() {
        
        guard let email = userEmailTextField.text,
            let password = userPasswordTextField.text else {return}
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let user = result?.user {
                self.navigateForUser(user)
            }
            if error != nil {
                ALRT.create(.alert,title: "Invalid email and Password").addAction("Retry").show()
            }
        }
    }
}


//MARK: UI Methods

extension LoginVC {
    func navigateForUser(_ user:User) {
        FirebaseHelper
            .shared
            .usersRef
            .child("\(user.uid)")
            .observeSingleEvent(of: .value,
                                with: { [unowned self](snapshot) in
                                    if snapshot.hasChild("role") {
                                        self.navigateToCourse()
                                    } else {
                                        self.navigateToSelectRole()
                                    }
            }) { (error) in
               
        }
    }
    private func navigateToSelectRole() {
        let selectRoleVC = storyboard?.instantiateViewController(withIdentifier: "SelectRoleVC") as! SelectRoleVC
        navigationController?.pushViewController(selectRoleVC, animated: true)
    }
    
    private func navigateToCourse() {
        let courseVC = storyboard?.instantiateViewController(withIdentifier: "CourseVC") as! CourseVC
        navigationController?.pushViewController(courseVC, animated: true)
    }
}
