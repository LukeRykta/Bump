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
    @State private var isOn = true
    let userDefaults = UserDefaults.standard

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!!")
        }
        .padding()
        HStack{
            Toggle("Advertise as Peripheral", isOn: $isOn)
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                .onChange(of: isOn){ value in
                    if value {
                        BTModel.messageText = "\(userDefaults.string(forKey: "phoneNumber") ?? "0698675309"),\(userDefaults.string(forKey: "firstName") ?? "John"),\(userDefaults.string(forKey: "lastName") ?? "John"),\(userDefaults.string(forKey: "emailAddress") ?? "john.doe@gmail.com")"
                        BTModel.peripheralManager.startAdvertising([CBAdvertisementDataServiceUUIDsKey: [PhoneTransferService.serviceUUID]])
                        
                        
                    }
                    else {
                        BTModel.peripheralManager.stopAdvertising()
                    }
                }.padding()
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
