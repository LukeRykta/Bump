//
//  User.swift
//  Bump
//
//  Created by wesley jackson on 3/25/23.
//

import Foundation
import Contacts

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

func saveContact(person: Person) {
        // Create a mutable object to add to the contact.
        // Mutable object means an object state that can be modified after created.
        let contact = CNMutableContact()
        // Name
        contact.givenName = "\(person.firstName) \(person.lastName)"
        // Phone No.
        contact.phoneNumbers = [CNLabeledValue(label: CNLabelPhoneNumberiPhone, value: CNPhoneNumber(stringValue: person.phoneNumber))]
        // Save the created contact.
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier: nil)
        do {
            try store.execute(saveRequest)
        } catch {
            print("Error occur: (error)")
            // Handle error
            // may add a alert...
        }
    print(contact.givenName)
}

let person1 = Person(firstName: "Wesley", lastName: "Jackson", emailAddress: "wes.jackson@gmail.com", phoneNumber: "3183470543")
let person2 = Person( firstName: "Ashley", lastName: "Makin", emailAddress: "ash.makin@gmail.com", phoneNumber: "2102227890")
