//
//  Relationship.swift
//  contacts
//
//  Created by Maurits van Beusekom on 28/08/2018.
//

import Foundation

class Relationship : Codable {
    var label: String = ""
    var name: String = ""
    var type: RelationshipType = RelationshipType.other
}
