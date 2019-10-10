//
//  PersonListView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-09-25.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

struct PersonListView: View {
    struct Row: View {
        var person: Person
        var body: some View {
            Text("\(person.firstName) \(person.lastName)")
        }
    }

    var persons: [Person]
    var body: some View {
        List(persons) { person in
            NavigationLink(destination: PersonDetailsView(person: person)) {
                Row(person: person)
            }
        }
        .navigationBarTitle(Text("Persons"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonListView(persons: Person.Preview.persons)
        }
    }
}
