//
//  LectureReviewVC.swift
//  Aula
//
//  Created by sumit oberoi on 4/15/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class LectureReviewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

//MARK: IBActions
extension LectureReviewVC {
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
