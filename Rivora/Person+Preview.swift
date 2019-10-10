//
//  Person+Preview.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-10-09.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import Foundation

extension Person {
    struct Preview {
        static let person1 = Person(id: "1", firstName: "John", lastName: "Doe")
        static let person2 = Person(id: "2", firstName: "Вячеслав", lastName: "Скоробогатько")
        static let persons: [Person] = [person1, person2]
    }
}
