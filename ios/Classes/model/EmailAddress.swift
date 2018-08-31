//
//  EmailAddress.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

class EmailAddress : Codable {
    var address : String = ""
    var label : String = ""
    var type : EmailAddressType = EmailAddressType.other
}
