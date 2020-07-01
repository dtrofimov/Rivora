//
//  HomeView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2020-07-01.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            NavigationLink(destination: LazyView(PersonListView(model: PersonListViewModelImpl(persons: Person.Preview.manyPersons)))) {
                Text("Person List")
            }
            NavigationLink(destination: LazyView(ProgrammaticNavigationExampleView(model: ProgrammaticNavigationExampleViewModelImpl()))) {
                Text("Programmatic Navigation Example")
            }
            NavigationLink(destination: LazyView(PublisherMVVMExampleView(model: PublisherMVVMExampleViewModelImpl()))) {
                Text("PublisherMVVM Example")
            }
            NavigationLink(destination: LazyView(ListStylingDemoView())) {
                Text("List Styling Demo")
            }
        }
        .navigationBarTitle("Rivora: SwiftUI Lab")
    }
}
