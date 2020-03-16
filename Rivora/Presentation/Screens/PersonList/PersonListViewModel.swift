//
//  PersonListViewModel.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 16.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import Then

class PersonListViewModel: PersonListView.Model {
    init(persons: [Person]) {
        super.init()
        self.do {
            $0.title = "Persons"
            $0.rows = persons.map { PersonListRowModel(person: $0) }
        }
    }
}
