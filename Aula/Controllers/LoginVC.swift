//
//  ViewController.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import Firebase
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
            
        }
    }
}


//MARK: UI Methods

extension LoginVC {
    
}
