//
//  LoginAPI.swift
//  taillog
//
//  Created by Shubham Tiwari on 21/08/24.
//

import Foundation

// MARK: - LoginAPI
class LoginApiModel: Codable {
    let token, host: String
    let acl: [String]
    let userID, operatorID: Int

    enum CodingKeys: String, CodingKey {
        case token, host, acl
        case userID = "user_id"
        case operatorID = "operator_id"
    }

    init(token: String, host: String, acl: [String], userID: Int, operatorID: Int) {
        self.token = token
        self.host = host
        self.acl = acl
        self.userID = userID
        self.operatorID = operatorID
    }
}
