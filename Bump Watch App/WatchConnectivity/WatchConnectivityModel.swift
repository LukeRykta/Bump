//
//  WatchConnectivityModel.swift
//  Bump Watch App
//
//  Created by Nicholas Schultz on 3/26/23.
//

import Foundation
import WatchConnectivity


class WatchSession : NSObject, WCSessionDelegate, ObservableObject{
    
    @Published var newContactMessage : String = ""
    @Published var userPhoneNumber : String = ""
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.userPhoneNumber = message["message"] as! String
        }
    }
}
func sendMessageWatchConnect(message: String, model: WatchSession) {
        model.session.sendMessage(["message": message], replyHandler: nil){
            (error) in
            print(error.localizedDescription)
        }
}
