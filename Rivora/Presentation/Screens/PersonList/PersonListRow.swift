//
//  PersonListRow.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 11.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import SwiftUI

extension PersonListView {
    struct Row: View {
        var person: Person
        var body: some View {
            Text("\(person.firstName) \(person.lastName)")
                .listRowBackground(Color.green)
        }
    }
}

struct PersonListRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView.Row(person: Person.Preview.person1)
            .previewLayout(.fixed(width: 300, height: 40))
    }
}
