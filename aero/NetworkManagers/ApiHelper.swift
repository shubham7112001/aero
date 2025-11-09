//
//  ApiHelper.swift
//  taillog
//
//  Created by Shubham Tiwari on 21/08/24.
//

import Foundation

struct Response {
    let data: Data
    let statusCode: Int
}

class ApiHelper : Codable{
    
    // Function to perform an API call with a dictionary and URL
    static func makeAPICall(with data: [String: Any]? = nil, to urlString: String, method: String? = "GET", completion: @escaping (Result<Response, ApiError>) -> Void) {
        guard let url = URL(string: urlString) else {
//            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            print("Invalid URL")
            return
        }
        
        
        var jsonData: Data? = nil
        if let data = data {
            jsonData = try? JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            if jsonData == nil {
//                completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON data"])))
                print("Invalid JSON data")
                return
            }
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = method?.uppercased() ?? "GET"
        
        if method?.uppercased() == "POST" {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
        }
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
           
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            
            if let data = data {
                
                guard let response = response as? HTTPURLResponse else {
                    return
                }
                completion(.success(Response(data: data, statusCode: response.statusCode)))
            } else {
                completion(.failure(ApiError(statusCode: statusCode)))
            }
        }.resume()
        
    }
}
