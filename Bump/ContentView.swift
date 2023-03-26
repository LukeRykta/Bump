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
    @State private var isOn = false
    
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
                        print("start advertising")
                        BTModel.peripheralManager.startAdvertising([CBAdvertisementDataServiceUUIDsKey: [PhoneTransferService.serviceUUID]])
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
