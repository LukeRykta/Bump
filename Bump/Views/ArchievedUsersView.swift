//
//  ArchievedUsersView.swift
//  Bump
//
//  Created by wesley jackson on 3/25/23.
//

import SwiftUI

struct ArchievedUsersView: View {
    
    var body: some View {
        List{
            UserCardView(person: person1)
                .listRowSeparator(.hidden)
            UserCardView(person: person2)
        }.onAppear(){
            //place function
        }
        .listStyle(.plain)
    }
}

struct ArchievedUsersView_Previews: PreviewProvider {
    static var previews: some View {
        ArchievedUsersView()
    }
}
