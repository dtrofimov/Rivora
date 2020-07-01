//
//  ProgrammaticNavigationExampleViewModel.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 27.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import SwiftUI

class ProgrammaticNavigationExampleViewModelImpl: ProgrammaticNavigationExampleView.Model, ObservableObject {
    var title: String { "Programmatic Navigation" }
    var openDetailsTitle: String { "Open Details" }
    @Published var isDetailsOpened: Bool = false {
        didSet {
            NSLog("Setting isDetailsOpened=\(isDetailsOpened)")
        }
    }

    // TODO: Move this to a dependency resolver
    var detailsView: AnyView {
        ProgrammaticNavigationExampleDetailsView(model: ProgrammaticNavigationExampleDetailsViewModelImpl(goBackHandler: { [weak self] in
            self?.isDetailsOpened = false
        }))
        .asAnyView
    }
}
