//
//  Asdf.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 11.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation
import SwiftUI
import Introspect

struct ListStylingDemoView: View {
    var body: some View {
        List {
            Section(header:
                Text("Section 0")
                    .foregroundColor(.green)
                    .introspectTableViewHeaderFooter {
                        $0.backgroundView?.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.5)
                }
            ) {
                ForEach(1...3, id: \.self) { i in
                    Text("qwer")
                        .padding(20)
                        .background(Color.yellow)
                        .listRowBackground(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.5)))
                }
                .introspectTableViewCell {
                    $0.backgroundColor = .clear
                }
            }
            ForEach(1...5, id: \.self) { iSection in
                Section(header:
                    Text("Section \(iSection)")
                        .foregroundColor(.yellow)
                        .introspectTableViewHeaderFooter {
                            $0.backgroundView?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 1, alpha: 0.5)
                    }
                ) {
                    ForEach((1...10).map { "\(iSection)_\($0)" }, id: \.self) { id in
                        Text("asdf \(id)")
                        .listRowBackground(Color(#colorLiteral(red: 0, green: 0, blue: 1, alpha: 0.5)))
                    }
                    .introspectTableViewCell {
                        $0.backgroundColor = .red
                    }
                }
            }
        }
        .cornerRadius(20)
        .introspectTableView {
            $0.separatorColor = .clear
            $0.tableFooterView = UIView()
            $0.backgroundColor = .clear
        }
        .padding(20)
        .background(Image("background").resizable(resizingMode: .tile))
        .navigationBarTitle("asdf")
    }
}

struct ListStylingDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListStylingDemoView()
        }
        .previewDevice(.init(rawValue: "iPhone SE"))
    }
}
