//
//  DatabaseService.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class DatabaseService {
    
    static let instance = DatabaseService()

    // Functions
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        DB_BASE_USERS.child(uid).updateChildValues(userData)
        
    }
    
    func createDBGroup() {
        DB_BASE.
    }
}
