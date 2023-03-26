//
//  User.swift
//  Bump
//
//  Created by wesley jackson on 3/25/23.
//

import Foundation

struct Person{
    let profileImage: String
    let firstName: String
    let lastName: String
    let emailAddress: String
    var phoneNumber: String
    let note: String
}

let person1 = Person(profileImage: "person1", firstName: "Wesley", lastName: "Jackson", emailAddress: "wes.jackson@gmail.com", phoneNumber: "3183470543", note: "Notes section of the app!")
let person2 = Person(profileImage: "person2", firstName: "Ashley", lastName: "Makin", emailAddress: "ash.makin@gmail.com", phoneNumber: "2102227890", note: "Call me maybe!")

var persons : [Person] = []


