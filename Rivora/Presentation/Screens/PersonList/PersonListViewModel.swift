//
//  PersonListViewModel.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 16.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import SwiftUI // TODO: Remove coupling with SwiftUI

class PersonListViewModel: PersonListView.Model {
    class Row: PersonListView.Row.Model {
        let person: Person

        init(person: Person) {
            self.person = person
            super.init()
            viewModel.firstName = person.firstName
            viewModel.lastName = person.lastName
        }

        override var id: String { person.id }

        override var viewToOpen: AnyView {
            // TODO: Move this to a dependency resolver
            PersonDetailsView(person: person).asAnyView
        }

    }

    init(persons: [Person]) {
        super.init()
        viewModel.title = "Persons"
        viewModel.rows = persons.map { Row(person: $0) }
    }
}
