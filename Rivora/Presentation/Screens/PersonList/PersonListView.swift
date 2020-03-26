//
//  PersonListView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-09-25.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

protocol PersonListViewModel: ObservableModel {
    var title: String { get }
    var rows: [PersonListRowViewModel] { get }
}

struct PersonListView: View {
    typealias Model = PersonListViewModel
    @ObservedModel private(set) var model: Model

    var body: some View {
        List {
            ForEach(model.rows, id: \.id) { rowModel in
                Row(model: rowModel)
            }
        }
        .navigationBarTitle(Text(model.title))
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonListView(model: PersonListViewModelImpl(persons: Person.Preview.manyPersons))
        }
        .previewDevice(.init(rawValue: "iPhone SE"))
    }
}
