//
//  Group.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/24/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation

class Group {
    
    private var _title: String
    private var _desc: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]
    
    var groupTitle: String {
        return _title
    }
    
    var groupDesc: String {
        return _desc
    }
    
    var groupKey: String {
        return _key
    }
    
    var memberCount: Int {
        return _memberCount
    }
    
    var members: [String] {
        return _members
    }

    init(title: String, desc: String, key: String, members: [String], memberCount: Int) {
        self._title = title
        self._desc = desc
        self._key = key
        self._members = members
        self._memberCount = memberCount
    }
    
}
