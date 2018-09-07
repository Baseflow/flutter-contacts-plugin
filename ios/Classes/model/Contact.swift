//
//  Contact.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

class Contact : Encodable {
    let id: String
    let isAggregate: Bool
    
    var displayName: String {
        var name: String = ""
        
        if (prefix != "") {
            name = "\(prefix) "
        }
        
        if (firstName != "") {
            name += "\(firstName) "
        }
        
        if (middleName != "") {
            name += "\(middleName) "
        }
        
        if (lastName != "") {
            name += "\(lastName) "
        }
        
        if (suffix != "") {
            name += "\(suffix)"
        }
        
        return name.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
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
    
    enum CodingKeys: String, CodingKey {
        case id
        case isAggregate
        case displayName
        case prefix
        case firstName
        case middleName
        case lastName
        case nickName
        case suffix
        case addresses
        case emailAddresses
        case instantMessagingAccounts
        case notes
        case organizations
        case phoneNumbers
        case relationships
        case websites
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(isAggregate, forKey: .isAggregate)
        try container.encode(displayName, forKey: .displayName)
        try container.encode(prefix, forKey: .prefix)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(middleName, forKey: .middleName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(nickName, forKey: .nickName)
        try container.encode(suffix, forKey: .suffix)
        try container.encode(addresses, forKey: .addresses)
        try container.encode(emailAddresses, forKey: .emailAddresses)
        try container.encode(instantMessagingAccounts, forKey: .instantMessagingAccounts)
        try container.encode(notes, forKey: .notes)
        try container.encode(organizations, forKey: .organizations)
        try container.encode(phoneNumbers, forKey: .phoneNumbers)
        try container.encode(relationships, forKey: .relationships)
        try container.encode(websites, forKey: .websites)
    }
}
