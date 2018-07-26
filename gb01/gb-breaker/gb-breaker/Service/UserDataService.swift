//
//  UserDataService.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase

class UserDataService {
    
    // Singleton
    static let instance = UserDataService()
    
    // Variables
    public private(set) var userEmail: String = ""
    public private(set) var userID: String = ""

    func userLoggedIn() {
        self.userEmail = (Auth.auth().currentUser?.email)!
        self.userID = (Auth.auth().currentUser?.uid)!
    }
    
}
