//
//  PersonListRowModel.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 16.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import SwiftUI

class PersonListRowModel: PersonListView.Row.Model {
    let person: Person

    init(person: Person) {
        self.person = person
        super.init()
        self.do {
            $0.id = person.id
            $0.firstName = person.firstName
            $0.lastName = person.lastName
        }
    }

    override var viewToOpen: AnyView {
        PersonDetailsView(person: person).asAnyView
    }
}
