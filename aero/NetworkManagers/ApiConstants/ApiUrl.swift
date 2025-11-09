//
//  ApiUrl.swift
//  taillog
//
//  Created by Shubham Tiwari on 21/08/24.
//

import Foundation

class ApiUrl{
    
    static let host = "https://staging.taillog.aero"
    
    static func getUrl(for endpoint: ApiEndpoints) -> String {
            return "\(host)\(endpoint.rawValue)"
        }
        
    static let login = getUrl(for: .login)
}
