//
//  DataService.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/20/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase

class UserDataService {
    
    // Singleton instantiation
    static let instance = UserDataService()
    
    // Variables
    public private(set) var userProfileImg = ""
    public private(set) var userEmail = ""
    public private(set) var userID = ""
    
    // Functions
    func setUserData() {
        userID = (Auth.auth().currentUser?.uid)!
        userEmail = (Auth.auth().currentUser?.email)!
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        DB_BASE_USERS.child(uid).updateChildValues(userData)
    }
    
    func getUserEmail(forUID uid: String, handler: @escaping (_ email: String) -> ()) {
        DB_BASE_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let users = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in users {
                if user.key == uid {
                    let email = user.childSnapshot(forPath: "email").value as! String
                    handler(email)
                }
            }
        }
    }
    
    func searchEmailAddresses(forSearchQuery query: String, handler: @escaping (_ emails: [String]) -> ()) {
        var emailArray = [String]()
        DB_BASE_USERS.observe(.value) { (userSnapshot) in
            guard let users = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in users {
                let email = user.childSnapshot(forPath: "email").value as! String
                if email.contains(query)/* && email != Auth.auth().currentUser?.email*/ {
                    emailArray.append(email)
                }
            }
            handler(emailArray)
        }
    }
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping CompletionHandler) {
        // If there is a group key, then we should send in the group
        if groupKey != nil {
            
        } else {
            // Otherwise send the message into the public feed
           
//            print(Auth.auth().currentUser?.uid)
            DB_BASE_FEED.childByAutoId().updateChildValues(["content": message, "senderID": uid])
            sendComplete(true, nil)
        }
    }    
}
