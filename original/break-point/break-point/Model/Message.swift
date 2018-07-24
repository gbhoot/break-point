//
//  Message.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/23/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation

class Message {
    
    private var _content: String
    private var _senderID: String
    
    var content: String {
        return _content
    }
    
    var senderID: String {
        return _senderID
    }
    
    init(content: String, senderId: String) {
        self._content = content
        self._senderID = senderId
    }
}
