//
//  PersonListView+Row.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 11.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import SwiftUI

protocol PersonListRowViewModel: ObservableModel {
    var id: String { get }
    var firstName: String { get }
    var lastName: String { get }
    var viewToOpen: AnyView { get }
}

extension PersonListView {
    struct Row: View {
        typealias Model = PersonListRowViewModel
        @ObservedModel private(set) var model: Model

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
        PersonListView.Row(model: PersonListViewModelImpl.Item(person: Person.Preview.person1))
            .previewLayout(.fixed(width: 300, height: 40))
    }
}
