//
//  UserDefaultHelper.swift
//  taillog
//
//  Created by Shubham Tiwari on 27/08/24.
//

import Foundation

final class UserDefaultHelper {

    static let standard = UserDefaultHelper()
    
    
    // Last Login User ID
    static func setLastLoginUserID(userID: Int) {
        UserDefaults.standard.set(userID, forKey: SensitiveTexts.lastLoginUserID)
    }

    static func getLastLoginUserID() -> Int? {
        return UserDefaults.standard.integer(forKey: SensitiveTexts.lastLoginUserID)
    }
}
