//
//  View+ReloadOn.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 19.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Combine
import SwiftUI

public struct ObservingView<PublisherType: Publisher, Content: View>: View where PublisherType.Failure == Never {
    typealias Value = PublisherType.Output

    private class Observer: ObservableObject {
        @Published var value: Value? = nil
    }

    private let disposable: AnyCancellable

    @ObservedObject private var observer: Observer

    private let contentBuilder: (Value) -> Content

    init(_ publisher: PublisherType, @ViewBuilder content: @escaping (Value) -> Content) {
        let observer = Observer()
        self.observer = observer
        self.contentBuilder = content
        self.disposable = publisher.sink {
            observer.value = $0
        }
    }

    public var body: some View {
        if let value = observer.value {
            return contentBuilder(value).asAnyView
        } else {
            return EmptyView().asAnyView
        }
    }
}
