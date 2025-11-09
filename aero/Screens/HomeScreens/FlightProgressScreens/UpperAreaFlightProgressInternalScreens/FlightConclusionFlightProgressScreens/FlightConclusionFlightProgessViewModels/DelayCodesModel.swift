//
//  DelayCodesModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 17/12/24.
//

import Foundation

class DelayCodesModel{
    let code_description: String
    let code_id: String
    let code_name: String
    let id: String
    let sub_code: String
    
    init(code_description: String, code_id: String, code_name: String, id: String, sub_code: String) {
        self.code_description = code_description
        self.code_id = code_id
        self.code_name = code_name
        self.id = id
        self.sub_code = sub_code
    }
}
