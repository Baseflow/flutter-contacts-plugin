//
//  Address.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

class Address : Codable {
    var label : String = ""
    var streetAddress : String = ""
    var city : String = ""
    var region : String = ""
    var country : String = ""
    var postalCode : String = ""
    var type : AddressType = AddressType.other
}
