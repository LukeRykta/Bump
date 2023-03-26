//
//  BumpApp.swift
//  Bump Watch App
//
//  Created by Luke Ryktarsyk on 3/25/23.
//

import SwiftUI

@main
struct Bump_Watch_AppApp: App {
    let session = WKExtendedRuntimeSession()
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            
            AccelerometerView().onAppear(){
                session.start()
            }
        }
    }
    
    func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        // Track when your session starts.
        print("Extended runtime session started.")
    }

    func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        // Finish and clean up any tasks before the session ends.
        
    }
        
    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
        // Track when your session ends.
        // Also handle errors here.
        print("An error during extended runtime occured.")
    }
}
