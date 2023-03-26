//
//  ContentView.swift
//  Bump Watch App
//
//  Created by Luke Ryktarsyk on 3/25/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var BTModel = WatchBluetoothModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
