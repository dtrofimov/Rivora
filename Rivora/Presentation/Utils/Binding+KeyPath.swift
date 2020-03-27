//
//  Binding+KeyPath.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 26.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import SwiftUI

extension Binding {
    init<Target>(to target: Target, _ keyPath: ReferenceWritableKeyPath<Target, Value>) {
        self.init(get: { target[keyPath: keyPath] },
                  set: { target[keyPath: keyPath] = $0 })
    }
}
