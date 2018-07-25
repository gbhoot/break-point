//
//  MessageService.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/24/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase

class MessageService {
    
    static let instance = MessageService()
    
    // Varibales
    var messagesFeed = [Message]()
    var groups = [Group]()
    
    
    // Functions
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
        messagesFeed.removeAll()
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
    }    
}
