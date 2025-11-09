//
//  LatLonModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 10/12/24.
//

import Foundation

class LatLonModel {
    var direction : Character
    var degree, minute, second : Int
    
    init(direction: Character, degree: Int, minute: Int, second: Int) {
        self.direction = direction
        self.degree = degree
        self.minute = minute
        self.second = second
    }
}
