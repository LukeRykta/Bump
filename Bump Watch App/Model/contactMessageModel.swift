//
//  contactMessageModel.swift
//  Bump Watch App
//
//  Created by Nicholas Schultz on 3/26/23.
//
import Foundation

struct Contact {
    var phoneNumber: String
    var firstName: String
    var lastName: String
    var email: String
}

func transferStringtoContact(contactString: String) -> Contact {
    let contactComponents = contactString.components(separatedBy: ",")
    let newContact = Contact(phoneNumber: contactComponents[0],
                firstName: contactComponents[1],
                lastName: contactComponents[2],
                email: contactComponents[3])
                
    return newContact
}
