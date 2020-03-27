//
//  PublisherMVVMExampleViewModel.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 19.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import Combine

class PublisherMVVMExampleViewModelImpl: PublisherMVVMExampleViewModel {
    var titlePublisher: AnyPublisher<String, Never> {
        Just("PublisherMVVM Example")
            .eraseToAnyPublisher()
    }

    var descriptionPublisher: AnyPublisher<String, Never> {
        Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .map { $0.description }
            .eraseToAnyPublisher()
    }
}
