//
//  JsonNode.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-10-04.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import Foundation

enum JsonNode {
    case null
    case string(_ value: String)
    case number(_ value: NSNumber)
    case bool(_ value: Bool)
    case dict(_ valuesForKeys: [String: JsonNode])
    case array(_ values: [JsonNode])
}

extension JsonNode {
    var jsonString: String {
        switch self {
        case .null:
            return "null"
        case let .string(value):
            return "\"\(value)\"" // TODO: escape
        case let .number(value):
            return value.stringValue
        case let .bool(value):
            return value ? "true" : "false"
        case let .dict(valuesForKeys):
            let entriesString = valuesForKeys.keys.sorted()
                .map { "\"\($0)\": \(valuesForKeys[$0]!.jsonString)" }
                .joined(separator: ", ")
            return "{\(entriesString)}"
        case let .array(values):
            let entriesString = values
                .map { $0.jsonString }
                .joined(separator: ", ")
            return "[\(entriesString)]"
        }
    }
}
