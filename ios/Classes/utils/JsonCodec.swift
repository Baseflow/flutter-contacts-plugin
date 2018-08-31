	//
//  JsonCodec.swift
//  contacts_plugin
//
//  Created by Maurits van Beusekom on 31/08/2018.
//

import Foundation

struct JsonCodec {
    private static let jsonEncoder = JSONEncoder()
    
    static func encodeToJsonString<T>(_ objectToEncode: T) -> String? where T : Encodable {
        let data = try! jsonEncoder.encode(objectToEncode)
        return String(data: data, encoding: .utf8)
    }
}
