//
//  ApiCallManager.swift
//  taillog
//
//  Created by Shubham Tiwari on 21/08/24.
//

import Foundation
import SwiftUI
import SwiftData
struct MessageModel : Codable{
    var message : String
}

class ApiCallManager{
    
    
    static func login(email : String, password : String, modelContext: ModelContext) async -> String{

        
         var msg : String = "Something went wrong"
        let data: [String: Any] = [
            "username": email,
            "password": password
        ]
        
       let res = await withCheckedContinuation { continuation in
            ApiHelper.makeAPICall(with: data, to: ApiUrl.login, method: ApiMethod.post.rawValue){ result in
                switch result {
                case .success(let response):
                    
                    
                    // Handle the successful response
                    if let responseString = String(data: response.data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                    print(response.statusCode)
                    
                    
                    if(response.statusCode == 200){
                        
                        msg = AppTexts.success
                        
                        do{
                            let decodedData = try JSONDecoder().decode(LoginApiModel.self , from: response.data);
                            print("Decoded Data => \(decodedData)")
                            print("Decoded Data Type=> \(type(of:decodedData))")
                            if decodedData.acl.contains(SensitiveTexts.accessApp){
                                modelContext.insert(LoginDB(email: email, token: decodedData.token, host: decodedData.host, acl: decodedData.acl, userID: decodedData.userID, operatorID: decodedData.operatorID))
                                UserDefaultHelper.setLastLoginUserID(userID: decodedData.userID)

                            }
                            else{
                                msg = "You don't have app permission"
                            }
                            
                        }catch{
                            print("catch block")
                        }
                        
                        
                    }
                    else{
                        do{
                            let decodedData = try JSONDecoder().decode(MessageModel.self , from: response.data);
                            print("Decoded Data => \(decodedData.message)")
                            msg = decodedData.message;
                        }catch{
                            print("catch block")
                        }
                    }
                    
                case .failure(let error):
                    // Handle the error
                    print("Error: \(error.localizedDescription)")
                    msg =  "Something went wrong"
                }
                continuation.resume(returning: msg)
            }
        }
        
        print(res)
        
        return msg;
    }
   
}
