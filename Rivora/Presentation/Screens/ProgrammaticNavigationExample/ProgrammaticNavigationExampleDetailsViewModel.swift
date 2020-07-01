//
//  ProgrammaticNavigationExampleDetailsViewModel.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 27.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation

class ProgrammaticNavigationExampleDetailsViewModelImpl: ProgrammaticNavigationExampleDetailsView.Model, ObservableObject {
    let goBackHandler: () -> Void
    init(goBackHandler: @escaping () -> Void) {
        self.goBackHandler = goBackHandler
    }

    var title: String { "Details" }
    var goBackTitle: String { "Go Back" }
    func didTapGoBack() {
        goBackHandler()
    }
}
