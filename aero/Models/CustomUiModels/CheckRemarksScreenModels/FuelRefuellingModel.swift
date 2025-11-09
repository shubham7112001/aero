//
//  FuelRefuellingModel.swift
//  taillog
//
//  Created by Shubham Tiwari on 05/09/24.
//

import Foundation
import SwiftData

@Model
class FuelRefuellingModel{
    var depReceiptImage: Data?
    var destReceiptImage: Data?
    var depReceiptNo: CGFloat?
    var destReceiptNo: CGFloat?
    var depVolumeInLitre: CGFloat?
    var destVolumeInLitre: CGFloat?
    var depVolumeInGallon: CGFloat?
    var destVolumeInGallon: CGFloat?
    var depWeight: CGFloat?
    var destWeight: CGFloat?
    var depSAF: CGFloat?
    var destSAF: CGFloat?
    var depDensityInKgLitre: CGFloat?
    var destDensityInKgLitre: CGFloat?
    var depDensityInLbGallon: CGFloat?
    var destDensityInLbGallon: CGFloat?
    var fuelSuppliers: [String]?
    var depSelectedFuelSupplier: String?
    var destSelectedFuelSupplier: String?
    
    init(depReceiptImage: Data? = nil, destReceiptImage: Data? = nil, depReceiptNo: CGFloat? = nil, destReceiptNo: CGFloat? = nil, depVolumeInLitre: CGFloat? = nil, destVolumeInLitre: CGFloat? = nil, depVolumeInGallon: CGFloat? = nil, destVolumeInGallon: CGFloat? = nil, depWeight: CGFloat? = nil, destWeight: CGFloat? = nil, depSAF: CGFloat? = nil, destSAF: CGFloat? = nil, depDensityInKgLitre: CGFloat? = nil, destDensityInKgLitre: CGFloat? = nil, depDensityInLbGallon: CGFloat? = nil, destDensityInLbGallon: CGFloat? = nil, fuelSuppliers: [String]? = nil, depSelectedFuelSupplier: String? = nil, destSelectedFuelSupplier: String? = nil) {
        self.depReceiptImage = depReceiptImage
        self.destReceiptImage = destReceiptImage
        self.depReceiptNo = depReceiptNo
        self.destReceiptNo = destReceiptNo
        self.depVolumeInLitre = depVolumeInLitre
        self.destVolumeInLitre = destVolumeInLitre
        self.depVolumeInGallon = depVolumeInGallon
        self.destVolumeInGallon = destVolumeInGallon
        self.depWeight = depWeight
        self.destWeight = destWeight
        self.depSAF = depSAF
        self.destSAF = destSAF
        self.depDensityInKgLitre = depDensityInKgLitre
        self.destDensityInKgLitre = destDensityInKgLitre
        self.depDensityInLbGallon = depDensityInLbGallon
        self.destDensityInLbGallon = destDensityInLbGallon
        self.fuelSuppliers = fuelSuppliers
        self.depSelectedFuelSupplier = depSelectedFuelSupplier
        self.destSelectedFuelSupplier = destSelectedFuelSupplier
    }
    
    }
