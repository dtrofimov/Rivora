//
//  ContentView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-09-25.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let json1: JsonNode = .dict(["asdf": .array([
            .null,
            .string("qwer"),
            .number(NSNumber(1.0)),
            .number(NSNumber(1.1)),
            .bool(true),
        ])])
        let json2 = jsonDict {
            "asdf" <- jsonArray {
                NSNull()
                "qwer"
                1
                1.1
                true
            }
            "fdsa" <- "fdsa"
        }
        let json3 = jsonDict {
            "asdf" <- 1
//            "fdsa" <- "fdsa"
        }
        let json4 = jsonArray {
            1
        }
//        let json3: JsonNode = jsonDict {
//            ("asdf", JsonNode.null)
//            ("asdf", JsonNode.null)
//        }
//        let json4 = jsonArray {
//            JsonNode.null
//        }
        return VStack {
            Text("\(json1.jsonString)")
            Text("\(json2.jsonString)")
            Text("\(json3.jsonString)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
