//
//  SplashVC.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import Firebase

class SplashVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigate()
        // Do any additional setup after loading the view.
    }
    
}

private extension SplashVC {
    func navigate() {
        if let user = Auth.auth().currentUser {
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
                    //TODO: Show Error
            }
           
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
