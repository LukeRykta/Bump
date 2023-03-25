//
//  ContentView.swift
//  Bump
//
//  Created by Luke Ryktarsyk on 3/25/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var BTModel = PhoneBluetoothModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
