//
//  KeychainHelper.swift
//  taillog
//
//  Created by Shubham Tiwari on 22/08/24.
//

import Foundation
import Security

class KeychainHelper {
    
    var attrService : String = "com.ssntpl.taillog"
    
    private func keychainQuery(withKey key: String) -> [String: Any] {
        return [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecAttrService as String: attrService,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
    }

    func save<T: Codable>(key: String, model: T) {
        // First delete any existing item
        delete(key: key)

        do {
            let data = try JSONEncoder().encode(model)

            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecAttrService as String: "attrService",
                kSecValueData as String: data
            ]

            SecItemAdd(query as CFDictionary, nil)
        } catch {
            print("Error encoding model: \(error)")
        }
    }

    func read<T: Codable>(key: String, modelType: T.Type) -> T? {
        let query = keychainQuery(withKey: key)
        var item: CFTypeRef?

        let status = SecItemCopyMatching(query as CFDictionary, &item)
        if status == errSecSuccess, let data = item as? Data {
            do {
                return try JSONDecoder().decode(modelType, from: data)
            } catch {
                print("Error decoding model: \(error)")
            }
        }
        return nil
    }

    func delete(key: String) {
        let query = keychainQuery(withKey: key)
        SecItemDelete(query as CFDictionary)
    }
}
