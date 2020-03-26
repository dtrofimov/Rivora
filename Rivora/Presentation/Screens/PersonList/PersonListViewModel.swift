//
//  PersonListViewModel.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 16.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import SwiftUI // TODO: Remove coupling with SwiftUI

class PersonListViewModelImpl: PersonListView.Model, ObservableObject {
    class Item: ObservableObject, PersonListView.Row.Model {
        var person: Person
        init(person: Person) {
            self.person = person
        }

        var id: String { person.id }
        var firstName: String { person.firstName }
        var lastName: String { person.lastName }

        var viewToOpen: AnyView {
            // TODO: Move this to a dependency resolver
            PersonDetailsView(model: PersonDetailsViewModelImpl(person: person)).asAnyView
        }
    }

    let items: [Item]
    init(persons: [Person]) {
        items = persons.map { Item(person: $0) }
    }

    var title: String { "Persons" }
    var rows: [PersonListRowViewModel] { items }
}
