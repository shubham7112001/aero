//
//  BiometricIDAuth.swift
//  taillog
//
//  Created by Shubham Tiwari on 22/08/24.
//

import Foundation
import LocalAuthentication

class BiometricIDAuth {
    private let context = LAContext()
    private let policy: LAPolicy
    private let localizedReason: String

    private var error: NSError?

    init(policy: LAPolicy = .deviceOwnerAuthentication,
         localizedReason: String = "Please verify your identity",
         localizedFallbackTitle: String = "Enter password",
         localizedCancelTitle: String = "Cancel") {
        self.policy = policy
        self.localizedReason = localizedReason
        context.localizedFallbackTitle = localizedFallbackTitle
        context.localizedCancelTitle = localizedCancelTitle
    }
    
    func canEvaluate(completion: (Bool, BiometricType, BiometricError?) -> Void) {
        guard context.canEvaluatePolicy(policy, error: &error) else {
            let type = biometricType(for: context.biometryType)
            guard let error = error else {
                return completion(false, type, nil)
            }
            return completion(false, type, biometricError(from: error))
        }
        completion(true, biometricType(for: context.biometryType), nil)
    }
    
    func evaluate(completion: @escaping (Bool, BiometricError?) -> Void) {
        context.evaluatePolicy(policy, localizedReason: localizedReason) { success, error in
            DispatchQueue.main.async {
                if success {
                    completion(true, nil)
                } else {
                    guard let error = error as? LAError else {
                        return completion(false, nil)
                    }
                    
                    switch error.code {
                    case .userFallback:
                        break
                        // Handle the "Enter App Password" action here
//                        self.promptForPassword(completion: completion)
                    case .userCancel:
                        // Handle the "Touch me not" action or simply return false
                        completion(false, .userCancel)
                    default:
                        completion(false, self.biometricError(from: error as NSError))
                    }
                }
            }
        }
    }
    
    private func biometricType(for type: LABiometryType) -> BiometricType {
        switch type {
        case .none:
            return .none
        case .touchID:
            return .touchID
        case .faceID:
            return .faceID
        case .opticID:
            return .none
        @unknown default:
            return .none
        }
    }

    private func biometricError(from nsError: NSError) -> BiometricError {
        let error: BiometricError
        
        switch nsError {
        case LAError.authenticationFailed:
            error = .authenticationFailed
        case LAError.userCancel:
            error = .userCancel
        case LAError.userFallback:
            error = .userFallback
        case LAError.biometryNotAvailable:
            error = .biometryNotAvailable
        case LAError.biometryNotEnrolled:
            error = .biometryNotEnrolled
        case LAError.biometryLockout:
            error = .biometryLockout
        default:
            error = .unknown
        }
        
        return error
    }
}
