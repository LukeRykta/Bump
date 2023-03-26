//
//  AccelerometerTestView.swift
//  bump Watch App
//
//  Created by Nicholas Schultz on 3/25/23.
//

import SwiftUI
import CoreMotion

struct AccelerometerView: View {
    
    let manager = CMMotionManager()
    let queue = OperationQueue()
    let session = WKExtendedRuntimeSession()
    
    @State var x : String = "0.0"
    @State var status : String = ""
    
    var test: Double = 0.5;
    
    var body: some View {
        VStack{
            Text(status)
            Text("x")
            
        }.onAppear{
            session.start()
            
            if self.manager.isAccelerometerAvailable == true {
                self.manager.startAccelerometerUpdates(to: self.queue){
                    (data: CMAccelerometerData?,error: Error?) in
                    
                    let accelerometer: CMAcceleration = data!.acceleration
                    x = "\(accelerometer.x)"
                    print(x)
                    if (accelerometer.x > test){
                        WatchHapticManager.shared.playHaptic()
                        print("SURPASSED")
                    }
                }
            }
            else {
                self.status = "Not Available"
            }
        }
    }
    
}

func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
    // Track when your session starts.
    print("did start")
}

func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
    // Finish and clean up any tasks before the session ends.
}
    
func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
    // Track when your session ends.
    // Also handle errors here.
}


struct AccelerometerView_Previews: PreviewProvider {
    static var previews: some View {
        AccelerometerView()
    }
}
