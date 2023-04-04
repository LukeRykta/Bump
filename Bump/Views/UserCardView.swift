//
//  UserCardView.swift
//  Bump
//
//  Created by wesley jackson on 3/25/23.
//

import SwiftUI

struct UserCardView: View {
    let person: Person
    var body: some View {
        VStack{
            ZStack{
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 80)
                    .clipped()
                Image("person1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
                    .clipShape(Circle())
                    .padding(.horizontal)
                    .scaledToFit()
                    .offset(y: 22)
            }
            VStack(spacing: 0.0){
                HStack(){
                    Text(person.firstName+" "+person.lastName)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                Text(person.phoneNumber)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom,.leading])
                    .font(.footnote)
                Text(person.emailAddress)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom,.leading])
                    .font(.footnote)
            }
        }
        .background(Color(.tertiarySystemFill))
        .cornerRadius(20)
    }
}
struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(person: person1)
            .previewLayout(.sizeThatFits)
    }
}
