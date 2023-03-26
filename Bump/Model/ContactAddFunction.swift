//
//  ContactAddFunction.swift
//  Bump
//
//  Created by wesley jackson on 3/26/23.
//

import Foundation
import Contacts

func addContact(person: Person){
    // Create a mutable object to add to the contact.
    // Mutable object means an object state that can be modified after created.
    let contact = CNMutableContact()
    // Name
    contact.givenName = person.firstName + " " + person.lastName
    // Phone No.
    contact.phoneNumbers = [CNLabeledValue(label: CNLabelPhoneNumberiPhone, value: CNPhoneNumber(stringValue: person.phoneNumber))]
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
