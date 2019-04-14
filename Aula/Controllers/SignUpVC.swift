//
//  SignUpVC.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import Firebase
class SignUpVC: UIViewController {
    @IBOutlet weak var collegeEmailTextField: CustomTextField!
    @IBOutlet weak var fullNameTextField: CustomTextField!
    
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var repeatPasswordTextField: CustomTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
}
//MARK: IBActions
extension SignUpVC {
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        signUp()
    }
}

//MARK: Firebase
extension SignUpVC {
    func signUp() {
        guard let email = collegeEmailTextField.text,
        let password = passwordTextField.text,
        let displayName = fullNameTextField.text else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) {[unowned self] (result, error) in
            if let user = result?.user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = displayName
                changeRequest.commitChanges(completion: { (error) in
                    print("User \(Auth.auth().currentUser?.displayName)")
                })
            }
            if let error = error {
                print("Erroor \(error)")
            }
        }
    }
}
