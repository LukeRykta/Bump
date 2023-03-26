//
//  ContentView.swift
//  Bump
//
//  Created by Luke Ryktarsyk on 3/25/23.
//
import SwiftUI
import CoreBluetooth

struct ContentView: View {
   
    @ObservedObject private var BTModel = PhoneBluetoothModel()
    @ObservedObject var WKModel = PhoneConnectivity()
   
    @State private var isOn = false
    let userDefaults = UserDefaults.standard
    
    //Send a message to watch before the view is initialized
    

    var body: some View {
        HomeView()
        HStack{
            Text(WKModel.newContactMessage)
            Toggle("Advertise as Peripheral", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                .onChange(of: isOn){ value in
                    if value {
                        //Setup and send userphoneNumber to Watch.
                        WKModel.userPhoneNumber = userDefaults.string(forKey: "phoneNumber") ?? "0698675309"
                        sendMessagetoWatchConnect(message: WKModel.userPhoneNumber, model: WKModel)
                        print("start advertising")
                        BTModel.messageText = "\(userDefaults.string(forKey: "phoneNumber") ?? "0698675309"),\(userDefaults.string(forKey: "firstName") ?? "John"),\(userDefaults.string(forKey: "lastName") ?? "John"),\(userDefaults.string(forKey: "emailAddress") ?? "john.doe@gmail.com")"

                        BTModel.peripheralManager.startAdvertising([CBAdvertisementDataServiceUUIDsKey: [PhoneTransferService.serviceUUID]])
                        WKModel.newContactMessage
                        
                    }
                    else {
                        print("stop advertising")
                        BTModel.peripheralManager.stopAdvertising()
                    }
                }
                .padding()
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
