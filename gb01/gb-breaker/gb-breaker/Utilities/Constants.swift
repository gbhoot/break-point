//
//  Constants.swift
//  gb-breaker
//
//  Created by Gurpreet Bhoot on 7/25/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase

// Completion Handler
typealias CompletionHandler         =   (_ status: Bool) -> ()
typealias CompletionHandlerArray    =   (_ array: [String], _ error: NSError?) -> ()
//typealias CompletionHandlerMessage = (_ messages: [String], _ error: NSError?) -> ()

// Storyboard IDs
let ID_SB_LOGIN_VC                  =   "loginVC"
let ID_SB_LOGIN_BY_EMAIL_VC         =   "loginByEmailVC"

// Table Cell IDs
let ID_TBL_FEED_CELL                =   "feedCell"
let ID_TBL_GROUPS_CELL              =   "groupsCell"

// Firebase Database
let FIR_DB_MAIN                     =   Database.database().reference()
let FIR_DB_USERS                    =   FIR_DB_MAIN.child("users")
let FIR_DB_FEED                     =   FIR_DB_MAIN.child("feed")
let FIR_DB_GROUPS                   =   FIR_DB_MAIN.child("groups")

