//
//  User.swift
//  Bump
//
//  Created by wesley jackson on 3/25/23.
//

import Foundation

struct Person{
    let firstName: String
    let lastName: String
    let emailAddress: String
    var phoneNumber: String
}

func transferStringtoPerson(personString: String) -> Person {
    let contactComponents = personString.components(separatedBy: ",")
    let newContact = Person(firstName: contactComponents[1],
                lastName: contactComponents[2],
                emailAddress: contactComponents[3],
                phoneNumber: contactComponents[0])
                
    return newContact
}

let person1 = Person(firstName: "Wesley", lastName: "Jackson", emailAddress: "wes.jackson@gmail.com", phoneNumber: "3183470543")
let person2 = Person( firstName: "Ashley", lastName: "Makin", emailAddress: "ash.makin@gmail.com", phoneNumber: "2102227890")
