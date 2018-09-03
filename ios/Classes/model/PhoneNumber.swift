//
//  PhoneNumber.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

class PhoneNumber : Codable {
    var label : String = ""
    var number : String = ""
    var type : PhoneNumberType = PhoneNumberType.other
}
