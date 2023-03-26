//
//  HomeView.swift
//  Bump
//
//  Created by wesley jackson on 3/25/23.
//

import SwiftUI

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
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
