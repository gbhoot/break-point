//
//  AuthService.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    // Singleton
    static let instance = AuthService()
    
    // Variables
    
    // Functions
    func registerUser(withEmail email: String, andPassword password: String, completion: @escaping CompletionHandler) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print(error!.localizedDescription)
                completion(false)
                return
            }
            print("\(user.email!) created")
            let userData = ["email": user.email!, "provider": user.providerID]
            DatabaseService.instance.createDBUser(withUID: user.uid, andUserData: userData)
            
            completion(true)
        }
    }
    
    func signUserIn(withEmail email: String, andPassword password: String, completion: @escaping CompletionHandler) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                print(error!.localizedDescription)
                completion(false)
            } else {
                completion(true)
                UserDataService.instance.userLoggedIn()
            }
        }
    }
    
    func signUserOut(completion: @escaping CompletionHandler) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            debugPrint(error.localizedDescription)
            completion(false)
        }
    }
}
