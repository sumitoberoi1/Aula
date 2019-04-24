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
    @IBOutlet weak var logoLeft: UIImageView!
    @IBOutlet weak var logoRight: UIImageView!
    @IBOutlet weak var logoLabel: UILabel!
    @IBOutlet weak var logoCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var completeLogo: UIStackView!
    @IBOutlet weak var stackViewTop: NSLayoutConstraint!
    @IBOutlet weak var tutorialTextView: UIStackView!
    @IBOutlet weak var step3StackView: UIStackView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var step2StackView: UIStackView!
    @IBOutlet weak var step1StackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigate()
        animate()
        // Do any additional setup after loading the view.
    }
}


private extension SplashVC {
   
    func animate() {
        hideAll()
        animateLeftLogo()
    }
    
    func hideAll() {
        logoLeft.alpha = 0.0
        logoRight.alpha = 0.0
        logoLabel.alpha = 0.0
        step1StackView.alpha = 0.0
        step2StackView.alpha = 0.0
        step3StackView.alpha = 0.0
        nextButton.alpha = 0.0
        self.logoLabel.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.logoLeft.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.logoRight.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    }
    
    func animateLeftLogo() {
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.3,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.logoLeft.alpha = 1.0
                        self.logoLeft.transform = CGAffineTransform.identity
        }) { (completed) in
            if completed {
                self.animateRightLogo()
            }
        }
    }
    func animateRightLogo() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.3,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.logoRight.alpha = 1.0
                        self.logoRight.transform = CGAffineTransform.identity
        }) { (completed) in
            if completed {
                self.animateLabel()
            }
        }
    }
    
    func animateLabel() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.3,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.logoLabel.alpha = 1.0
                        self.logoLabel.transform = CGAffineTransform.identity
        }) { (completed) in
            if completed {
                self.navigate()
            }
        }
    }
    
    
    func moveLogoUp() {
        UIView.animate(withDuration: 0.6,
                       delay: 0.4,
                       options: .curveEaseInOut,
                       animations: {
                        self.logoCenterYConstraint.constant = -(self.view.frame.height/2 - self.completeLogo.frame.height+80.0)
                        self.completeLogo.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                        self.view.layoutIfNeeded()
        }) { (completed) in
            //Do Something here
            self.animateTutorialStackView()
        }
    }
    
    func animateTutorialStackView() {
        UIView.animate(withDuration: 0.7,
                       delay: 0.4,
                       options: .curveEaseInOut,
                       animations: {
                        self.stackViewTop.constant = self.tutorialTextView.frame.height +  (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0) + 50.0
                        self.view.layoutIfNeeded()
        }) { (completed) in
            //Do Something here
            self.animateFirstStackView()
        }
    }
    
    func animateFirstStackView() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.5,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.step1StackView.alpha = 1.0
        }) { (completed) in
            if completed {
                self.animateSecondStackView()
            }
        }
    }
    
    func animateSecondStackView() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.5,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.step2StackView.alpha = 1.0
        }) { (completed) in
            if completed {
                self.animateThirdStackView()
            }
        }
    }
    
    func animateThirdStackView() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.5,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.step3StackView.alpha = 1.0
        }) { (completed) in
            if completed {
                self.animateNextButton()
            }
        }
    }
    
    func animateNextButton() {
        UIView.animate(withDuration: 0.3,
                       delay: 0.5,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.nextButton.alpha = 1.0
        }) { (completed) in
            if completed {
                //self.animateNextButton()
            }
        }
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
                                        
                                        HelperMethods.delayWithSeconds(0.2, completion: {
                                            if snapshot.hasChild("role") {
                                                self.navigateToCourse()
                                            } else {
                                                self.navigateToSelectRole()
                                            }
                                        })
                                        
                }) { (error) in
                    self.moveLogoUp()
            }
           
        } else {
            moveLogoUp()
        }
    }
    
    private func navigateToSelectRole() {
        let selectRoleVC = storyboard?.instantiateViewController(withIdentifier: "SelectRoleVC") as! SelectRoleVC
        navigationController?.pushViewController(selectRoleVC, animated: true)
    }
    
    private func navigateToRegister() {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    private func navigateToCourse() {
        let courseVC = storyboard?.instantiateViewController(withIdentifier: "CourseVC") as! CourseVC
        navigationController?.pushViewController(courseVC, animated: true)
    }
    

}
