//
//  WatchSplashView.swift
//  Bump Watch App
//
//  Created by wesley jackson on 3/25/23.
//

import SwiftUI

struct WatchSplashView: View {
    @State private var isActive = false
    @State private var size = 0.80
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack{
                VStack(alignment: .center){
                    Image("gojo")
                        .resizable()
                }
                .scaleEffect(size,anchor: .center)
                .onAppear{
                    withAnimation(.easeOut(duration: 2.2)){
                        self.size = 0.42
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct WatchSplashView_Previews: PreviewProvider {
    static var previews: some View {
        WatchSplashView()
    }
}
