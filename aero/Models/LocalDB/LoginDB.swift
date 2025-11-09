//
//  LoginDB.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/08/24.
//

import Foundation
import SwiftData

@Model
class LoginDB {
    @Attribute(.unique) var email: String
    let token: String
    let host: String
    let acl: [String]
    @Attribute(.unique) var userID: Int
    let operatorID: Int
    
    init(email: String, token: String, host: String, acl: [String], userID: Int, operatorID: Int) {
        self.email = email
        self.token = token
        self.host = host
        self.acl = acl
        self.userID = userID
        self.operatorID = operatorID
    }
}
