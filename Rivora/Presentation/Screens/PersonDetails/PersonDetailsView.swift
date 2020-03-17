//
//  PersonDetailsView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-10-09.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

struct PersonDetailsView: View {
    class Model: NSObject, ObservableObject {
        @Published var title: String = ""
        @Published var firstName: String = ""
        @Published var lastName: String = ""
    }

    @ObservedObject var model: Model

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
            PersonDetailsView(model: PersonDetailsViewModel(person: Person.Preview.person1))
        }
    }
}
