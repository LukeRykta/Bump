//
//  FirstInstallView.swift
//  Bump
//
//  Created by wesley jackson on 3/26/23.
//

import SwiftUI
import Contacts


struct FirstInstallView: View {
    
//    func isValidEmail(_ email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//
//        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailPred.evaluate(with: email)
//    }
    
        let emailAddressPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]{1,15}")
        let numberPredicate = NSPredicate(format: "SELF MATCHES %@", "[0-9]{10}")
       @State private var firstTimeUser = false
       @State private var firstName = ""
       @State private var lastName = ""
       @State private var emailAddress = ""
       @State private var phoneNumber = ""
       @State private var path = NavigationPath()
       @AppStorage("userInfo") var userInfo: String?
       
       var body: some View {
           if firstTimeUser{
               ContentView()
           }else{
               NavigationStack(){
                       VStack{
                           Form {
                               TextField("First Name: ", text: $firstName)
                               TextField("Last Name: ", text: $lastName)
                               TextField("Email Address: ", text: $emailAddress)
                               TextField("Phone Number: ", text: $phoneNumber)
                           }
                           //".action", move view to contentView()
                           .navigationTitle("User Details")
                           .toolbar{ToolbarItemGroup(placement: .navigationBarTrailing){
                                   Button {
                                       hideKeyboard()
                                       impact(.soft)
                                   }label: {
                                       Image(systemName: "keyboard.chevron.compact.down")
                                   }
                               
                               Button("Save") {
                                   if fieldValidation(){
                                       saveDefaultUser()
                                       printValues()
                                       haptic(.success)
                                   }else{
                                       print("Error: wrong format!")
                                   }
                               }
                               
                               }
                           }
                           //1. come back to fix button!
                       }
                   }
           }
       }

    
    func fieldValidation()-> Bool{
        
        if emailAddressPredicate.evaluate(with: emailAddress) && !emailAddress.isEmpty &&
           numberPredicate.evaluate(with: phoneNumber) && !phoneNumber.isEmpty &&
           namePredicate.evaluate(with: firstName) && !firstName.isEmpty &&
           namePredicate.evaluate(with: lastName) && !lastName.isEmpty{
            
            return true
            
        }else{
            print("Error: wrong format!")
            return false
        }
    }
       
       
       func saveDefaultUser(){
           UserDefaults.standard.set(firstName, forKey: "firstName")
           UserDefaults.standard.set(lastName, forKey: "lastName")
           UserDefaults.standard.set(emailAddress, forKey: "emailAddress")
           UserDefaults.standard.set(phoneNumber, forKey: "phoneNumber")
           contactPermission()
           firstTimeUser = true
       }
       
       func printValues() {
           print("Firstname entered: " + firstName)
           print("Lastname entered: " + lastName)
           print("Email entered: " + emailAddress)
           print("Phone Number entered: " + phoneNumber)
       }
       
       private func contactPermission(){
           print("Access to contacts")
           let store = CNContactStore()
           store.requestAccess(for: .contacts){
               (granted, err) in
               if let err = err{
                   print("Failed to request access", err)
                   return
               }
               if granted{
                   print("Access granted")
               }else {
                   print("Access denied")
               }
           }
       }
       
   }

struct FirstInstallView_Previews: PreviewProvider {
    static var previews: some View {
        FirstInstallView()
    }
}

extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
