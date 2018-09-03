//
//  ContactManager.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

class ContactManager : NSObject {
    
    static func fetchContacts(result: @escaping FlutterResult) {
        let strategy = createContactStrategy()
        let contacts = strategy.fetchContacts()
        
        let jsonString = JsonCodec.encodeToJsonString(contacts)
        result(jsonString)
    }
    
    private static func createContactStrategy() -> ContactStrategy {
        if #available(iOS 9.0, *) {
            return ContactStoreStrategy()
        } else {
            // TODO: Add ABAdressBook implementation (pre iOS 9.0)
            abort()
        }
    }
}
