//
//  Organization.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

class Organization : Codable {
    var jobTitle : String = ""
    var label : String = ""
    var name : String = ""
    var type : OrganizationType = OrganizationType.other
}
