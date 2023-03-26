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
    var i : Int = 0
    var newContact = Contact(phoneNumber: "", firstName: "", lastName: "", email: "")
    for comp in contactComponents {
        if i == 0{
            newContact.phoneNumber = contactComponents[i]
        }
        if i == 1{
            newContact.firstName = contactComponents[i]
        }
        if i == 2{
            newContact.lastName = contactComponents[i]
        }
        if i == 3{
            newContact.email = contactComponents[i]
        }
        i+=1
    }
                
    return newContact
}
