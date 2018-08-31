//
//  RelationshipType.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

enum RelationshipType : String, Codable {
    case father = "father"
    case mother = "mother"
    case parent = "parent"
    case brother = "brother"
    case sister = "sister"
    case child = "child"
    case friend = "friend"
    case spouse = "spouse"
    case partner = "partner"
    case assistant = "assistant"
    case manager = "manager"
    case other = "other"
}
