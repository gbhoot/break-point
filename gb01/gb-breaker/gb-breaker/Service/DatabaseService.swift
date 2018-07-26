//
//  DatabaseService.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase

class DatabaseService {
    
    // Singleton
    static let instance = DatabaseService()
    
    // Variables
    
    // Functions
    func createDBUser(withUID uid: String, andUserData userData: Dictionary<String, Any>) {
        FIR_DB_USERS.child(uid).updateChildValues(userData)
    }
}
