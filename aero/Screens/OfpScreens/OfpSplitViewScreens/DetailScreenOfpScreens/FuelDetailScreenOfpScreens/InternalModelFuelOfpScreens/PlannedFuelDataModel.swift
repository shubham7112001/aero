//
//  PlannedFuelDataModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 02/01/25.
//

import Foundation

class PlannedFuelDataModel: Identifiable{
    let id = UUID()
    let fl: Int
    let wc: Int
    let time: String
    let fuel: Int
    let oneTon: Int
    let costDiff: Int
    
    init(fl: Int, wc: Int, time: String, fuel: Int, oneTon: Int, costDiff: Int) {
        self.fl = fl
        self.wc = wc
        self.time = time
        self.fuel = fuel
        self.oneTon = oneTon
        self.costDiff = costDiff
    }
}
