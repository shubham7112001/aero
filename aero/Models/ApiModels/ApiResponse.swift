//
//  ApiResponse.swift
//  taillog
//
//  Created by Shubham Tiwari on 22/08/24.
//

import Foundation

class ApiResponse<T: Decodable>: Decodable {

    let success: Bool
    let response: String
    let responseDescription: String
    let dataArray: [T]?

    enum CodingKeys: CodingKey {
        case success
        case response
        case responseDescription
        case dataArray
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.response = try container.decode(String.self, forKey: .response)
        self.responseDescription = try container.decode(String.self, forKey: .responseDescription)
        self.dataArray = try container.decodeIfPresent([T].self, forKey: .dataArray)
    }
}
