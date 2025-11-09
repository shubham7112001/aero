//
//  NetworkMonitor.swift
//  taillog
//
//  Created by Shubham Tiwari on 29/08/24.
//

import Foundation
import Network


class NetworkMonitor : ObservableObject{
    static let shared = NetworkMonitor()
    
    private var networkMonitor = NWPathMonitor()
    @Published var isConnected = false

    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        networkMonitor.start(queue: DispatchQueue.main)
    }
}
