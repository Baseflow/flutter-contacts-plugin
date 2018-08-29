//
//  ContactStoreStrategy.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Contacts
import Foundation

@available(iOS 9.0, *)
class ContactStoreStrategy : ContactStrategy {
    func fetchContacts() -> [Contact] {
        return [Contact]()
    }
    
}
