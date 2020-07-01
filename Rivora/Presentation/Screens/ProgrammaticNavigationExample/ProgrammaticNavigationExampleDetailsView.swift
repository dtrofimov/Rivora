//
//  ProgrammaticNavigationExampleDetailsView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 27.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

protocol ProgrammaticNavigationExampleDetailsViewModel: ObservableModel {
    var title: String { get }
    var goBackTitle: String { get }
    func didTapGoBack()
}

struct ProgrammaticNavigationExampleDetailsView: View {
    typealias Model = ProgrammaticNavigationExampleDetailsViewModel
    @ObservedModel var model: Model

    var body: some View {
        let model = self.model
        return Button(model.goBackTitle) {
            model.didTapGoBack()
        }
        .navigationBarTitle(model.title)
    }
}
