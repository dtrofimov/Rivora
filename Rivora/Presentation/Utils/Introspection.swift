//
//  Introspection.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 12.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import Introspect
import SwiftUI

enum TargetViewSelector {
    public static func sibling<TargetView: PlatformView>(from entry: PlatformView) -> TargetView? {
        guard let viewHost = Introspect.findViewHost(from: entry) else {
            return nil
        }
        return Introspect.previousSibling(containing: TargetView.self, from: viewHost)
    }

    public static func ancestorOrSibling<TargetView: PlatformView>(from entry: PlatformView) -> TargetView? {
        if let tableView = Introspect.findAncestor(ofType: TargetView.self, from: entry) {
            return tableView
        }
        return sibling(from: entry)
    }
}

extension View {
    public func introspectTableViewHeaderFooter(customize: @escaping (UITableViewHeaderFooterView) -> ()) -> some View {
        return introspect(selector: TargetViewSelector.ancestorOrSibling, customize: customize)
    }

    /// Finds a `UITableViewCell` from a `SwiftUI.List`, or `SwiftUI.List` child. You can attach this directly to the element inside the list.
    public func introspectTableViewCell(customize: @escaping (UITableViewCell) -> ()) -> some View {
        return introspect(selector: TargetViewSelector.ancestorOrSibling, customize: customize)
    }
}
