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
    case iphone = "iphone"
    case main = "main"
    case mobile = "mobile"
    case work = "work"
    case workFax = "workFax"
    case pager = "pager"
    case other = "other"
}
