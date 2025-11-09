//
//  AppRegex.swift
//  taillog
//
//  Created by Shubham Tiwari on 22/08/24.
//

import Foundation

class AppRegex{
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let val =  emailPred.evaluate(with: email.trim())
        print(email, val)
        return val;
    }
}
