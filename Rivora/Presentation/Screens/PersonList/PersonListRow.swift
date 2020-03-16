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
        class Model: NSObject, ObservableObject, Identifiable {
            var id: String = ""
            @Published var firstName: String = ""
            @Published var lastName: String = ""
            var viewToOpen: AnyView { fatalError("Not implemented") }
        }

        @ObservedObject var model: Model

        var body: some View {
            NavigationLink(destination: model.viewToOpen) {
                Text("\(model.firstName) \(model.lastName)")
                    .listRowBackground(Color.green)
            }
        }
    }
}

struct PersonListRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonListView.Row(model: PersonListRowModel(person: Person.Preview.person1))
            .previewLayout(.fixed(width: 300, height: 40))
    }
}
