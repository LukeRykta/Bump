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
                Image(person.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 60)
                    .clipShape(Circle())
                    .offset(y: 40)
                    .padding(.horizontal)
            }
            VStack(spacing: 0.0){
                HStack(){
                    Text(person.firstName+""+person.lastName)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                Text(person.phoneNumber)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom,.leading])
                    .font(.footnote)
                Text(person.note)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom,.leading])
                    .font(.footnote)
            }
        }
        .cornerRadius(20)
        .background(Color(.tertiarySystemFill))
    }
}
struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(person: person1)
            .previewLayout(.sizeThatFits)
    }
}
