//
//  PersonDetailsView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-10-09.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

protocol PersonDetailsViewModel: ObservableModel {
    var title: String { get }
    var firstName: String { get }
    var lastName: String { get }
}

struct PersonDetailsView: View {
    typealias Model = PersonDetailsViewModel
    @ObservedModel var model: Model

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(model.firstName)
                Text(model.lastName)
                Spacer()
            }
            Spacer()
        }
        .navigationBarTitle(Text(model.title))
    }
}

struct PersonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonDetailsView(model: PersonDetailsViewModelImpl(person: Person.Preview.person1))
        }
    }
}
