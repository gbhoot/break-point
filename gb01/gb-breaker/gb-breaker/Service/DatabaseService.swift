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
    
    func downloadDBUserEmails(withSearch query: String, handler: @escaping CompletionHandlerArray) {
        var emailAddresses = [String]()
        FIR_DB_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let users = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in users {
                let email = user.childSnapshot(forPath: "email").value as! String
                if email.contains(query) == true {
                    emailAddresses.append(email)
                }
            }
            handler(emailAddresses,nil)
        }
    }
    
    func createDBGroup(withGroup group: Group) {
        FIR_DB_GROUPS.childByAutoId().updateChildValues([
            "title":        group.groupTitle,
            "description":  group.groupDesc,
            "members":      group.groupUsers
            ])
    }
    
    func addGroupToUser(withGroupID group: String, forUser email: String, handler: @escaping CompletionHandler) {
        FIR_DB_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let users = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in users {
                let uEmail = user.childSnapshot(forPath: "email").value as! String
                if uEmail == email {
                    FIR_DB_USERS.child(user.key).updateChildValues([
                        "groups":   group
                        ])
                    handler(true)
                }
            }
        }
    }
}
