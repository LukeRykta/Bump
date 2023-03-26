//
//  WatchSplashView.swift
//  Bump Watch App
//
//  Created by wesley jackson on 3/25/23.
//

import SwiftUI

struct WatchSplashView: View {
    @State private var isActive = false
    @State private var size = 0.90
    
    let session = WKExtendedRuntimeSession()
    
    var body: some View {
        if isActive {
            AccelerometerView().onAppear(){
                session.start()
            }
        } else {
            VStack{
                VStack(alignment: .center){
                    Image("bumpLogo")
                        .resizable()
                }
                .scaleEffect(size,anchor: .center)
                .onAppear{
                    withAnimation(.easeOut(duration: 1.5)){
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

func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
    // Track when your session starts.
    print("Extended runtime session started.")
}

func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
    // Finish and clean up any tasks before the session ends.
    print("session ending...")
}
    
func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
    // Track when your session ends.
    // Also handle errors here.
    print("An error during extended runtime occured.")

}

struct WatchSplashView_Previews: PreviewProvider {
    static var previews: some View {
        WatchSplashView()
    }
}
