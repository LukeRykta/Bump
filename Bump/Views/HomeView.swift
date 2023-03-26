//
//  HomeView.swift
//  Bump
//
//  Created by wesley jackson on 3/25/23.
//

import SwiftUI
import Contacts

struct HomeView: View {
    var body: some View {
        ZStack{
            NavigationStack{
                List {
                    NavigationLink("User Info", value: 42)
                    NavigationLink("Archieved Bumps", value: "Hello, world!")
                    NavigationLink("Update User Info", value: Double.pi)
                }
                .navigationDestination(for: Int.self) { _ in UserCardView(person: person1) }
                .navigationDestination(for: String.self) { _ in ArchievedUsersView() }
                // insert update default user info
                //.navigationDestination(for: Double.self) { _ in  }
                .navigationTitle("Select a value")
            }
            Button("+ Add to Contacts") {
                // Create a mutable object to add to the contact.
                // Mutable object means an object state that can be modified after created.
                let contact = CNMutableContact()
                // Name
                contact.givenName = "Ming"
                // Phone No.
                contact.phoneNumbers = [CNLabeledValue(label: CNLabelPhoneNumberiPhone, value: CNPhoneNumber(stringValue: "12345678"))]
                // Save the created contact.
                let store = CNContactStore()
                let saveRequest = CNSaveRequest()
                saveRequest.add(contact, toContainerWithIdentifier: nil)
                do {
                    try store.execute(saveRequest)
                } catch {
                    print("Error occur: \(error)")
                    // Handle error
                    // may add a alert...
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
