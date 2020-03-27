//
//  ProgrammaticNavigationExampleView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 27.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

protocol ProgrammaticNavigationExampleViewModel: ObservableModel {
    var title: String { get }
    var openDetailsTitle: String { get }
    var isDetailsOpened: Bool { get set }
    var detailsView: AnyView { get }
}

struct ProgrammaticNavigationExampleView: View {
    typealias Model = ProgrammaticNavigationExampleViewModel
    @ObservedModel var model: Model

    var body: some View {
        let model = self.model
        let isDetailsOpenedBinding = Binding(to: model, \.isDetailsOpened)
        return VStack {
            NavigationLink(destination: LazyView(model.detailsView), isActive: isDetailsOpenedBinding, label: { EmptyView() })
            Button(model.openDetailsTitle) {
                model.isDetailsOpened = true
            }
        }
        .navigationBarTitle(model.title)
    }
}
