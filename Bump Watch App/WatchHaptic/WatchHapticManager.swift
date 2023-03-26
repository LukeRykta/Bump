//
//  WatchHapticManager.swift
//  Bump Watch App
//
//  Created by Brandon on 3/25/23.
//

import Foundation
import UIKit
import WatchKit

class WatchHapticManager {
    static let shared = WatchHapticManager()
    
    private init() {}
    
    func playHaptic() {
        WKInterfaceDevice.current().play(.click)
    }
}
