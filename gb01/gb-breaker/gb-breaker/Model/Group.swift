//
//  Group.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation

class Group {
    
    // Variables
    public private(set) var groupTitle: String = ""
    public private(set) var groupDesc: String = ""
    public private(set) var groupUsers = [String]()
    public private(set) var groupMessages = [Message]()
    
    init(title: String, description: String) {
        self.groupTitle = title
        self.groupDesc = description
    }
}
