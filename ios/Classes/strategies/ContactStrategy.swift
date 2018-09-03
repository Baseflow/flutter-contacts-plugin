//
//  ContactStrategyProtocol.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

protocol ContactStrategy {
    func fetchContacts() -> [Contact];
}
