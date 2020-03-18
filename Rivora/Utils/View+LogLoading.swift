//
//  View+LogLoading.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 17.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

private struct LoggingView<Wrapped: View>: View {
    let wrapped: Wrapped
    let name: String
    var body: some View {
        NSLog("Loading \(name)")
        return wrapped
    }
}

extension View {
    func logLoading(_ name: String) -> some View {
        LoggingView(wrapped: self, name: name)
    }
}
