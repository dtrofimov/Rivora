//
//  PersonListView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-09-25.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

struct PersonListView: View {
    class Model: NSObject, ObservableObject {
        @Published var title: String = ""
        @Published var rows: [Row.Model] = []
    }

    @ObservedObject var model: Model

    var body: some View {
        List {
            ForEach(model.rows) { rowModel in
                Row(model: rowModel)
            }
        }
        .navigationBarTitle(Text(model.title))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonListView(model: PersonListViewModel(persons: Person.Preview.manyPersons))
        }
        .previewDevice(.init(rawValue: "iPhone SE"))
    }
}
