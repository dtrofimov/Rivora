//
//  PersonListView+Row.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 11.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import SwiftUI

extension PersonListView {
    struct Row: View {
        class Model: ObservableObject, Identifiable {
            var id: String { fatalError("Not implemented") }
            @Published var firstName: String = ""
            @Published var lastName: String = ""
            var viewToOpen: AnyView { fatalError("Not implemented") }
        }

        @ObservedObject private(set) var model: Model

        var body: some View {
            NavigationLink(destination: LazyView(self.model.viewToOpen)) {
                Text("\(model.firstName) \(model.lastName)")
                    .listRowBackground(Color.green)
            }
        }
    }
}

struct PersonListRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView.Row(model: PersonListViewModel.Row(person: Person.Preview.person1))
            .previewLayout(.fixed(width: 300, height: 40))
    }
}
