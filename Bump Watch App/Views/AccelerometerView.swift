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
    
    
    
    @State var x : Double = 0.0
    @State var status : String = ""
    
    @State var peakFlag : Bool = false
    @State var valleyFlag : Bool = false
    @State var latency : Int = 0
    
    //Variables to tune event detection
    private var pthresholdMin : Double = 0.5   // Peak min threshold (in G's)
    private var vthresholdMin : Double = -0.5  // Valley min threshold (in G's)
    private var pthresholdMax : Double = 1.0   // Peak max threshold (in G's)
    private var vthresholdMax : Double = -1.0  // Valley max threshold (in G's)
    private var maxLatency : Int = 10
    
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
                    x = accelerometer.x
                    print(x)
                    
                    if (peakFlag == false && x > pthresholdMin && x < pthresholdMax){
                        peakFlag = true
                        status = "Peak detected"
                    }
                    
                    else if(peakFlag == true && x > vthresholdMin){
                        latency += 1
                        status = "Waiting for valley"
                    }
                    
                    else if (peakFlag == true && x < vthresholdMin && x > vthresholdMax && latency <= maxLatency){
                        valleyFlag = true
                        status = "Detected a bump, Initializing connection"
                        self.manager.stopAccelerometerUpdates()
                    }
                    if (latency > maxLatency){
                        peakFlag = false
                        valleyFlag = false
                        latency = 0
                    }
                    print(status)
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
