//
//  Message.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation

class Message {
    
    // Variables
    public private(set) var content: String = ""
    public private(set) var senderID: String = ""
    public private(set) var senderEmail: String = ""
    
    init(message: String, sender: String, email: String) {
        self.content = message
        self.senderID = sender
        self.senderEmail = email
    }
}
