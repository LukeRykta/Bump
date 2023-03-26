//
//  CircleView.swift
//  Bump
//
//  Created by wesley jackson on 3/25/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .frame(minWidth: 100)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            .scaledToFit()
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("person1"))
    }
}
