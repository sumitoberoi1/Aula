//
//  FirebaseHelper.swift
//  Aula
//
//  Created by sumit oberoi on 4/14/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import Foundation
import Firebase

class FirebaseHelper {
    static let shared = FirebaseHelper()
    var dbRef = Database.database().reference()
    var usersRef = Database.database().reference().ref.child("users")
    let coursesRef = Database.database().reference().ref.child("courses")
}
