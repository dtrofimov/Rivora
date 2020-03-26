//
//  PersonDetailsViewModel.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 16.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation

class PersonDetailsViewModelImpl: PersonDetailsView.Model, ObservableObject {
    let person: Person
    init(person: Person) {
        self.person = person
    }

    var title: String { person.firstName }
    var firstName: String { person.firstName }
    var lastName: String { person.lastName }
}
