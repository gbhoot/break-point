//
//  MessageService.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase

class MessageService {
    
    // Singleton
    static let instance = MessageService()
    
    // Variables
    var feedMessages = [Message]()
    var groups = [Group]()
    
    // Functions
    func uploadFeedMessage(withContent message: String, fromSender senderID: String, andEmail email: String, handler: CompletionHandler) {
        FIR_DB_FEED.childByAutoId().updateChildValues([
            "message": message,
            "senderID": senderID,
            "senderEmail": email
            ])
        handler(true)
    }
    
    func downloadFeedMessages(completion: @escaping CompletionHandler) {
        self.feedMessages.removeAll()
        FIR_DB_FEED.observeSingleEvent(of: .value) { (messageSnapshot) in
            guard let messages = messageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for message in messages {
                let content = message.childSnapshot(forPath: "message").value as! String
                let sender = message.childSnapshot(forPath: "senderID").value as! String
                let email = message.childSnapshot(forPath: "senderEmail").value as! String
                let newMessage = Message(message: content, sender: sender, email: email)
                self.feedMessages.append(newMessage)
            }
            completion(true)
        }
    }
}
