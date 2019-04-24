//
//  TopicVC.swift
//  Aula
//
//  Created by sumit oberoi on 4/8/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class TopicVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
}

//MARK: IBActions

extension TopicVC {
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: TableView Data Source
extension TopicVC:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topicCell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicCell
        return topicCell
    }
}

//MARK: UItableViewDelegate methods
extension TopicVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let topicCollectionVC = storyboard?.instantiateViewController(withIdentifier: "TopicCollectionVC") as! TopicCollectionVC
        navigationController?.pushViewController(topicCollectionVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
