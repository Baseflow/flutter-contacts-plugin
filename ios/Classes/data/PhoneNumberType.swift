//
//  PhoneNumberType.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

enum PhoneNumberType : String, Codable {
    case home = "home"
    case homeFax = "homeFax"
    case work = "work"
    case workFax = "workFax"
    case pager = "pager"
    case mobile = "mobile"
    case other = "other"
}
