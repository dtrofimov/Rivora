//
//  JsonBuilder.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-10-04.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import Foundation

@_functionBuilder public struct ArrayBuilder {
    static func buildBlock<T>(_ items: T...) -> [T] {
        return items
    }

    static func buildBlock<T>(_ item: T) -> [T] {
        return [item]
    }
}

// MARK: Array building

func jsonArray(@ArrayBuilder _ block: () -> [JsonCompatible]) -> JsonNode {
    return .array(block().map { $0.jsonNode })
}

func jsonArray(_ block: () -> JsonCompatible) -> JsonNode {
    return jsonArray { [block()] }
}

// MARK: Dictionary building

typealias JsonKeyValue = (String, JsonCompatible)

infix operator <-

func <- <Left, Right>(lhs: Left, rhs: Right) -> (Left, Right) {
    return (lhs, rhs)
}

func jsonDict(@ArrayBuilder _ block: () -> [JsonKeyValue]) -> JsonNode {
    var result: [String: JsonNode] = [:]
    for keyValue in block() {
        result[keyValue.0] = keyValue.1.jsonNode
    }
    return .dict(result)
}

func jsonDict(_ block: () -> JsonKeyValue) -> JsonNode {
    return jsonDict { [block()] }
}
