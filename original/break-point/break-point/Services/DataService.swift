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
    var messagesFeed = [Message]()
    
    // Functions
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        DB_BASE_USERS.child(uid).updateChildValues(userData)
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
    
    func getAllFeedMessages(receiveComplete: @escaping CompletionHandler) {
        DB_BASE_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessages = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for message in feedMessages {
                let content = message.childSnapshot(forPath: "content").value as! String
                let sender = message.childSnapshot(forPath: "senderID").value as! String
                let newMessage = Message(content: content, senderId: sender)
//                print(newMessage.content)
                self.messagesFeed.append(newMessage)
                
                receiveComplete(true, nil)
            }
        }
        
        let mess = Message(content: "Come On Bro", senderId: (Auth.auth().currentUser?.uid)!)
        self.messagesFeed.append(mess)
        print("Number of messages: \(messagesFeed.count)")
    }
}
