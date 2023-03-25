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
    
    @State var x : String = "0.0"
    @State var status : String = ""
    
    var body: some View {
        VStack{
            Text(status)
            Text("x")
            
        }.onAppear {
            if self.manager.isAccelerometerAvailable == true {
                self.manager.startAccelerometerUpdates(to: self.queue){
                    (data: CMAccelerometerData?,error: Error?) in
                    
                    let accelerometer: CMAcceleration = data!.acceleration
                    x = "\(accelerometer.x)"
                    print(x)
                }
            }
            else {
                self.status = "Not Available"
            }
        }
    }
}

struct AccelerometerView_Previews: PreviewProvider {
    static var previews: some View {
        AccelerometerView()
    }
}
