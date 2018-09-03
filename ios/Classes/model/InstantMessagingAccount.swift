//
//  InstantMessagingAccount.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

class InstantMessagingAccount : Codable {
    var account : String = ""
    var label : String = ""
    var service : InstantMessagingService = InstantMessagingService.other
}
