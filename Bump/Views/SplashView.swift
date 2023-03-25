//
//  SplashView.swift
//  Bump
//
//  Created by wesley jackson on 3/25/23.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 1.3
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack{
                VStack(alignment: .center){
                    Image("fistbumpjake")
                        .resizable()
                        .frame(width: 600, height: 1300)
                }
                .scaleEffect(size,anchor: .center)
                .onAppear{
                    withAnimation(.easeOut(duration: 3.2)){
                        self.size = 0.699
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

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
