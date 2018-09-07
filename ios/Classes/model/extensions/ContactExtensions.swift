//
//  ContactExtensions.swift
//  contacts_plugin
//
//  Created by Maurits van Beusekom on 29/08/2018.
//

import Contacts
import Foundation

@available(iOS 9.0, *)
extension Array where Element:CNContact {
    func toContacts() -> [Contact] {
        return self.map { $0.toContact() }
    }
}

@available(iOS 9.0, *)
extension CNContact {
    func toContact() -> Contact {
        let contact = Contact(id: self.identifier, isAggregate: true)
        contact.prefix = self.namePrefix
        contact.firstName = self.givenName
        contact.middleName = self.middleName
        contact.lastName = self.familyName
        contact.nickName = self.nickname
        contact.suffix = self.nameSuffix
        
        contact.addresses = self.postalAddresses.toAddresses()
        contact.emailAddresses = self.emailAddresses.toEmailAddresses()
        contact.instantMessagingAccounts = self.instantMessageAddresses.toInstantMessagingAccounts()
        contact.notes = CNContact.toNotes(content: self.note)
        contact.organizations = self.toOrganizations()
        contact.phoneNumbers = self.phoneNumbers.toPhoneNumbers()
        contact.relationships = self.contactRelations.toRelationships()
        contact.websites = self.urlAddresses.toWebsites()
        
        return contact
    }
    
    func toOrganizations() -> [Organization] {
        let organization = Organization()
        organization.name = self.organizationName
        organization.jobTitle = self.jobTitle
        organization.label = CNLabelWork.localizedCapitalized
        organization.type = OrganizationType.work

        return [organization]
    }
    
    private static func toNotes(content: String) -> [Note] {
        if (content.isEmpty) {
            return [Note]()
        }
        
        let note = Note()
        note.content = content
        
        return [note]
    }
}

@available(iOS 9.0, *)
private extension Array where Element:CNLabeledValue<CNContactRelation> {
    func toRelationships() -> [Relationship] {
        return self.map { $0.toRelationship() }
    }
}

@available(iOS 9.0, *)
private extension CNLabeledValue where ValueType == CNContactRelation {
    func toRelationship() -> Relationship {
        let cnContactRelation = self.value
        let relationship = Relationship()
        relationship.label = self.label ?? CNLabelOther.localizedCapitalized
        relationship.name = cnContactRelation.name
        relationship.type = CNLabeledValue.toRelationshipType(label: self.label)
        
        return relationship
    }
    
    private static func toRelationshipType(label: String?) -> RelationshipType {
        guard let safeLabel = label else {
            return RelationshipType.other
        }
        
        switch safeLabel {
        case CNLabelContactRelationFather:
            return RelationshipType.father
        case CNLabelContactRelationMother:
            return RelationshipType.mother
        case CNLabelContactRelationParent:
            return RelationshipType.parent
        case CNLabelContactRelationBrother:
            return RelationshipType.brother
        case CNLabelContactRelationSister:
            return RelationshipType.sister
        case CNLabelContactRelationChild:
            return RelationshipType.child
        case CNLabelContactRelationFriend:
            return RelationshipType.friend
        case CNLabelContactRelationSpouse:
            return RelationshipType.spouse
        case CNLabelContactRelationPartner:
            return RelationshipType.partner
        case CNLabelContactRelationAssistant:
            return RelationshipType.assistant
        case CNLabelContactRelationManager:
            return RelationshipType.manager
        default:
            return RelationshipType.other
        }
    }
}

@available(iOS 9.0, *)
private extension Array where Element:CNLabeledValue<CNInstantMessageAddress> {
    func toInstantMessagingAccounts() -> [InstantMessagingAccount] {
        return self.map { $0.toInstantMessagingAccount() }
    }
}

@available(iOS 9.0, *)
private extension CNLabeledValue where ValueType == CNInstantMessageAddress {
    func toInstantMessagingAccount() -> InstantMessagingAccount {
        let instantMessageAddress = self.value
        let account = InstantMessagingAccount()
        account.account = instantMessageAddress.username
        account.label = instantMessageAddress.service
        account.service = CNLabeledValue.toInstantMessagingService(service: instantMessageAddress.service)
        
        return account
    }
    
    private static func toInstantMessagingService(service: String) -> InstantMessagingService {
        switch service {
        case CNInstantMessageServiceAIM:
            return InstantMessagingService.aim
        case CNInstantMessageServiceFacebook:
            return InstantMessagingService.facebook
        case CNInstantMessageServiceGaduGadu:
            return InstantMessagingService.gaduGadu
        case CNInstantMessageServiceGoogleTalk:
            return InstantMessagingService.googleTalk
        case CNInstantMessageServiceICQ:
            return InstantMessagingService.icq
        case CNInstantMessageServiceJabber:
            return InstantMessagingService.jabber
        case CNInstantMessageServiceMSN:
            return InstantMessagingService.msn
        case CNInstantMessageServiceQQ:
            return InstantMessagingService.qq
        case CNInstantMessageServiceSkype:
            return InstantMessagingService.skype
        case CNInstantMessageServiceYahoo:
            return InstantMessagingService.yahoo
        default:
            return InstantMessagingService.other
        }
    }
}

@available(iOS 9.0, *)
private extension Array where Element:CNLabeledValue<CNPhoneNumber> {
    func toPhoneNumbers() -> [PhoneNumber] {
        return self.map { $0.toPhoneNumber() }
    }
}

@available(iOS 9.0, *)
private extension CNLabeledValue where ValueType == CNPhoneNumber {
    func toPhoneNumber() -> PhoneNumber {
        let cnPhoneNumber = self.value
        let phoneNumber = PhoneNumber()
        phoneNumber.label = self.label ?? CNLabelOther.localizedCapitalized
        phoneNumber.number = cnPhoneNumber.stringValue
        phoneNumber.type = CNLabeledValue.toPhoneNumberType(label: self.label)
        
        return phoneNumber
    }
    
    private static func toPhoneNumberType(label: String?) -> PhoneNumberType {
        guard let safeLabel = label else {
            return PhoneNumberType.other
        }
        
        switch safeLabel {
        case CNLabelHome:
            return PhoneNumberType.home
        case CNLabelPhoneNumberHomeFax:
            return PhoneNumberType.homeFax
        case CNLabelPhoneNumberiPhone:
            return PhoneNumberType.iphone
        case CNLabelPhoneNumberMain:
            return PhoneNumberType.main
        case CNLabelPhoneNumberMobile:
            return PhoneNumberType.mobile
        case CNLabelPhoneNumberPager:
            return PhoneNumberType.pager
        case CNLabelWork:
            return PhoneNumberType.work
        case CNLabelPhoneNumberWorkFax:
            return PhoneNumberType.workFax
        default:
            return PhoneNumberType.other
        }
    }
}

@available(iOS 9.0, *)
private extension Array where Element:CNLabeledValue<CNPostalAddress> {
    func toAddresses() -> [Address] {
        return self.map { $0.toAddress() }
    }
}

@available(iOS 9.0, *)
private extension CNLabeledValue where ValueType == CNPostalAddress {
    func toAddress() -> Address {
        let postalAddress = self.value
        
        let address = Address()
        address.city = postalAddress.city
        address.country = postalAddress.country
        address.label = self.label ?? CNLabelOther.localizedCapitalized
        address.postalCode = postalAddress.postalCode
        address.region = postalAddress.state
        address.streetAddress = postalAddress.street
        address.type = CNLabeledValue.toAddressType(label: self.label)
        
        return address
    }
    
    private static func toAddressType(label: String?) -> AddressType {
        guard let safeLabel = label else {
            return AddressType.other
        }
        
        switch safeLabel {
        case CNLabelHome:
            return AddressType.home
        case CNLabelWork:
            return AddressType.work
        default:
            return AddressType.other
        }
    }
}

@available(iOS 9.0, *)
private extension Array where Element:CNLabeledValue<NSString> {
    func toEmailAddresses() -> [EmailAddress] {
        return self.map { $0.toEmailAddress() }
    }
    
    func toWebsites() -> [Website] {
        return self.map { $0.toWebsite() }
    }
}

@available(iOS 9.0, *)
private extension CNLabeledValue where ValueType == NSString {
    func toEmailAddress() -> EmailAddress {
        let emailAddress = EmailAddress()
        emailAddress.address = self.value as String
        emailAddress.label = self.label ?? CNLabelOther.localizedCapitalized
        emailAddress.type = CNLabeledValue.toEmailType(label: self.label)
        
        return emailAddress
    }
    
    func toWebsite() -> Website {
        let website = Website()
        website.address = self.value as String
        
        return website
    }
    
    private static func toEmailType(label: String?) -> EmailAddressType {
        guard let safeLabel: String = label else {
            return EmailAddressType.other
        }
        
        switch safeLabel {
        case CNLabelHome:
            return EmailAddressType.home
        case CNLabelWork:
            return EmailAddressType.work
        default:
            return EmailAddressType.other
        }
    }
}
