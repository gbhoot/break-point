//
//  User.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation

class User {
    
    // Variables
    public private(set) var userEmail: String = ""
    public private(set) var userProvider: String = ""
    public private(set) var userGroups = [String]()
    
    init(email: String, provider: String) {
        self.userEmail = email
        self.userProvider = provider
//        self.userGroups = groups
    }
}
