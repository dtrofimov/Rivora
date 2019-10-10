//
//  PersonDetailsView.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 2019-10-09.
//  Copyright © 2019 Dmitrii Trofimov. All rights reserved.
//

import SwiftUI

struct PersonDetailsView: View {
    let person: Person

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(person.firstName)
                Text(person.lastName)
                Spacer()
            }
            Spacer()
        }
        .navigationBarTitle(Text(person.firstName))
    }
}

struct PersonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PersonDetailsView(person: personPreview1)
    }
}
