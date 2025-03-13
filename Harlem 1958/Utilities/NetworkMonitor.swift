//
//  NetworkMonitor.swift
//  Harlem 1958
//
//  Created by Manhattan on 13/03/25.
//

import SwiftUI
import Network

// This has issues on simulator

@Observable
class NetworkMonitor {
    var isConnected = true
    var showAlert = false
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                let connected = path.status == .satisfied
                
                // Only show alert when connection is lost
                if self?.isConnected == true && !connected {
                    self?.showAlert = true
                }
                
                self?.isConnected = connected
            }
        }
        monitor.start(queue: queue)
    }
    
    deinit {
        monitor.cancel()
    }
}
