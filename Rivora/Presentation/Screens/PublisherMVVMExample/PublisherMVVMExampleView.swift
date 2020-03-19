//
//  PublisherMVVMExampleView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 18.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

protocol PublisherMVVMExampleViewModel {
    var titlePublisher: AnyPublisher<String, Never> { get }
    var descriptionPublisher: AnyPublisher<String, Never> { get }
}

struct PublisherMVVMExampleView: View {
    let model: PublisherMVVMExampleViewModel

    var body: some View {
        List {
            ObservingView(model.titlePublisher) {
                Text($0)
            }
            ObservingView(model.descriptionPublisher) {
                Text($0)
            }
        }
    }
}

struct PublisherMVVMExampleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PublisherMVVMExampleView(model: PublisherMVVMExampleViewModelImpl())
        }
        .previewDevice(.init(rawValue: "iPhone SE"))
    }
}
