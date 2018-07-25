//
//  AuthService.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/20/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping CompletionHandler) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let newUser = user else {
                userCreationComplete(false, error)
                return
            }
            let userData = ["provider": newUser.user.providerID, "email": newUser.user.email!] as Dictionary<String, Any>
            DatabaseService.instance.createDBUser(uid: newUser.user.uid, userData: userData)
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping CompletionHandler) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil {
                loginComplete(false, error)
                return
            } else {
                loginComplete(true, nil)
            }
        }
    }
    
}
