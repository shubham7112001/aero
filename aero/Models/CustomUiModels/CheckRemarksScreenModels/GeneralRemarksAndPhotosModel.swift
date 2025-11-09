//
//  GeneralRemarksAndPhotosModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 04/09/24.
//

import Foundation
import SwiftData

@Model
class GeneralRemarksAndPhotosModel{
    var remarks: String
    @Attribute(.externalStorage) var defectImages: [Data?]?
    
    init(remarks: String, defectImages: [Data?]? = nil) {
        self.remarks = remarks
        self.defectImages = defectImages
    }
}
