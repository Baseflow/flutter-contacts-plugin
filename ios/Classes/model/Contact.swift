//
//  Contact.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

class Contact : Codable {
    let id: String
    let isAggregate: Bool
    
    var displayName: String = ""
    var prefix: String = ""
    var firstName: String = ""
    var middleName: String = ""
    var lastName: String = ""
    var nickName: String = ""
    var suffix: String = ""
    
    var addresses = [Address]()
    var emailAddresses = [EmailAddress]()
    var instantMessagingAccounts = [InstantMessagingAccount]()
    var notes = [Note]()
    var organizations = [Organization]()
    var phoneNumbers = [PhoneNumber]()
    var relationships = [Relationship]()
    var websites = [Website]()
    
    init(id: String, isAggregate: Bool) {
        self.id = id
        self.isAggregate = isAggregate
    }
}
