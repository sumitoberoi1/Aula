//
//  SignUpVC.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import Firebase
import ALRT
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
        
        
        if let fullName = fullNameTextField.text,
            fullName.count < 6 {
            ALRT.create(.alert,title: StringConstants.fullNameError).addOK().show()
            return
        }
        
        if let email = collegeEmailTextField.text,
            !email.isValidEmail() {
            ALRT.create(.alert,title: StringConstants.emailError).addOK().show()
            return
        }
        
        if let password = passwordTextField.text,
            password.count < 6 {
            ALRT.create(.alert,title: StringConstants.passwordError).addOK().show()
            return
        }
        
        if let confirmPassword = repeatPasswordTextField.text,
            let password = passwordTextField.text,
            confirmPassword.count < 6{
            if (confirmPassword != password) {
                ALRT.create(.alert,title: StringConstants.repeatPasswordError).addOK().show()
            }
            return
        }
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
                    self.navigateToSelectRole()
                })
            }
            if let error = error {
                print("Erroor \(error)")
            }
        }
    }
    private func navigateToSelectRole() {
        let selectRoleVC = storyboard?.instantiateViewController(withIdentifier: "SelectRoleVC") as! SelectRoleVC
        navigationController?.pushViewController(selectRoleVC, animated: true)
    }
    
}
