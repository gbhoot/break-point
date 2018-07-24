//
//  Constants.swift
//  break-point
//
//  Created by Gurpreet Bhoot on 7/20/18.
//  Copyright © 2018 Gurpal Bhoot. All rights reserved.
//

import Foundation
import Firebase

typealias CompletionHandler = (_ status: Bool, _ error: Error?) -> ()

// Database
let DB_BASE                     =   Database.database().reference()
let DB_BASE_USERS               =   DB_BASE.child("users")
let DB_BASE_GROUPS              =   DB_BASE.child("groups")
let DB_BASE_FEED                =   DB_BASE.child("feed")

// Identifiers - SB/SB Segues
let ID_SB_LOGIN_VC              =   "loginVC"
let ID_SB_LOGIN_EMAIL_VC        =   "loginEmailVC"
//let ID_SB_SEGUE_EMAIL_LOGIN_VC  =   "loginByEmailVC"

// Identifiers - Table View Cells
let ID_TB_FEED_CELL             =   "feedCell"

