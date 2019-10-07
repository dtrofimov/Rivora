//
//  JsonCompatible.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-10-04.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import Foundation

protocol JsonCompatible {
    var jsonNode: JsonNode { get }
}

extension JsonNode: JsonCompatible {
    var jsonNode: JsonNode {
        return self
    }
}

extension NSNumber: JsonCompatible {
    var jsonNode: JsonNode {
        return .number(self)
    }
}

extension Int: JsonCompatible {
    var jsonNode: JsonNode {
        return NSNumber(value: self).jsonNode
    }
}

extension Double: JsonCompatible {
    var jsonNode: JsonNode {
        return NSNumber(value: self).jsonNode
    }
}

extension String: JsonCompatible {
    var jsonNode: JsonNode {
        return .string(self)
    }
}

extension NSNull: JsonCompatible {
    var jsonNode: JsonNode {
        return .null
    }
}

extension Bool: JsonCompatible {
    var jsonNode: JsonNode {
        return .bool(self)
    }
}
