//
//  DeicingModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 30/08/24.
//

import Foundation
import SwiftData

@Model
class DeicingModel : Identifiable{
    var id : Int?
    var holdoverTime: Date?
    var startTime: Date?
    var endTime: Date?
    @Attribute(.externalStorage) var receiptImage: Data?
    var receiptNo: Int?
    var supplier: Int?
    var steps: [DeicingStepModel]?
    
    init(id: Int? = 1, holdoverTime: Date? = nil, startTime: Date? = nil, endTime: Date? = nil, receiptImage: Data? = nil, receiptNo: Int? = nil, supplier: Int? = nil, steps: [DeicingStepModel]? = nil) {
        self.id = id
        self.holdoverTime = holdoverTime
        self.startTime = startTime
        self.endTime = endTime
        self.receiptImage = receiptImage
        self.receiptNo = receiptNo
        self.supplier = supplier
        self.steps = steps
    }
    
    static let mockDeicingModel = DeicingModel(
        holdoverTime: Date(),
        startTime: Date().addingTimeInterval(-3600), // 1 hour before now
        endTime: Date().addingTimeInterval(-1800),   // 30 minutes before now
//        receiptImage: Data(base64Encoded: "exampleBase64EncodedImageData"),
        receiptNo: 123456,
        supplier: 7890,
        steps: [DeicingStepModel.mockDeicingStepModel]
    )
}
