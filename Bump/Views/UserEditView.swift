//
//  UserEditView.swift
//  Bump
//
//  Created by wesley jackson on 3/25/23.
//

import SwiftUI

struct UserEditView: View {
    let person: Person
    var body: some View {
        VStack{
            ZStack{
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
                Image(person.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 120)
                    .clipShape(Circle())
                    .offset(y: 50)
                    .padding(.horizontal)
            }
            .overlay(alignment: .topTrailing) {
                Button{
                    //?
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .padding(6)
                }
            }
            VStack{
                Button {
                    //?
                } label: {
                    Text("Follow")
                        .padding(20)
                }

            }
        }
    }
}


struct UserEditView_Previews: PreviewProvider {
    static var previews: some View {
        UserEditView(person: person1)
            .previewLayout(.sizeThatFits)
    }
}
