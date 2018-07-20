//
//  DataService.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/20/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
    // Singleton instantiation
    static let instance = DataService()
    
    // Varibales
    
    // Functions
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        DB_BASE_USERS.child(uid).updateChildValues(userData)
    }
}
