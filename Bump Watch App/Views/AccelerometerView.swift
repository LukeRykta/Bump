//
//  AccelerometerTestView.swift
//  bump Watch App
//
//  Created by Nicholas Schultz on 3/25/23.
//

import SwiftUI
import CoreMotion
import CoreBluetooth
import WatchConnectivity

struct AccelerometerView: View {
    
    @ObservedObject private var BTModel = WatchBluetoothModel();
    
    //Create Motion Manager & Operation's queue
    let manager = CMMotionManager()
    let queue = OperationQueue()
    
    //Create watchConnectivitySession
    var watchConnectionSession = WatchSession()
    
    @State var x : Double = 0.0
    @State var status : String = ""
    @State var BTtext : String = "empty.."
    
    @State var peakFlag : Bool = false
    @State var valleyFlag : Bool = false
    @State var latency : Int = 0
    
    //Variables to tune event detection
    private var pthresholdMin : Double = 0.3   // Peak min threshold (in G's)
    private var vthresholdMin : Double = -0.3  // Valley min threshold (in G's)
    private var pthresholdMax : Double = 1.0   // Peak max threshold (in G's)
    private var vthresholdMax : Double = -1.0  // Valley max threshold (in G's)
    private var maxLatency : Int = 10
    
    var test: Double = 0.5;
    
    var body: some View {
        VStack{
            Text(status)
            Text(BTtext)
        }.onAppear{
//            session.start()
            if self.manager.isAccelerometerAvailable == true {
                self.manager.startAccelerometerUpdates(to: self.queue){
                    (data: CMAccelerometerData?,error: Error?) in
                    
                    let accelerometer: CMAcceleration = data!.acceleration
                    x = accelerometer.x
                    print(x)
                    
                    //Detect a peak based on the value of the accelerometer x-axis.
                    if (peakFlag == false && x > pthresholdMin && x < pthresholdMax){
                        peakFlag = true
                        status = "Peak detected"
                    }
                    
                    //Start counting the latency between the peak and valley.
                    else if(peakFlag == true && x > vthresholdMin){
                        latency += 1
                        status = "Waiting for valley"
                    }
                    
                    //Detect valley and finish accelerometer updates.
                    else if (peakFlag == true && x < vthresholdMin && x > vthresholdMax && latency <= maxLatency){
                        valleyFlag = true
                        status = "Detected a bump, Initializing connection"
                        self.manager.stopAccelerometerUpdates()
                        //BTModel.retrievePeripheral()
                        BTtext = BTModel.messageText
                        //Parse BTModel.messageText
                        var newContact = transferStringtoContact(contactString: BTModel.messageText)
                        if newContact.phoneNumber == watchConnectionSession.userPhoneNumber{
                            //Continue searching for signals
                        }else{
                            print(BTtext)
                            WatchHapticManager.shared.playHaptic()
                            //Send message via WatchConnectivity to Phone
                            sendMessageWatchConnect(message: BTModel.messageText, model: watchConnectionSession)
                        }
                        
                        
                    }
                    
                    //If we are outside of our window reset our states.
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

struct AccelerometerView_Previews: PreviewProvider {
    static var previews: some View {
        AccelerometerView()
    }
}
