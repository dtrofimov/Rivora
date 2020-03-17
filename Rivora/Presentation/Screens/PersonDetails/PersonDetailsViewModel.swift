//
//  PersonDetailsViewModel.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 16.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation

class PersonDetailsViewModel: PersonDetailsView.Model {
    let person: Person

    init(person: Person) {
        self.person = person
        super.init()
        viewModel.title = person.firstName
        viewModel.firstName = person.firstName
        viewModel.lastName = person.lastName
    }
}
