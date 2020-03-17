//
//  ObservableObject+SelfFix.swift
//  Rivora
//
//  Created by Dmitrii Trofimov on 17.03.2020.
//  Copyright © 2020 Dmitrii Trofimov. All rights reserved.
//

import Foundation

extension ObservableObject {
    /**
     Returns the receiver to mutate parent `@Published` properties.

    If a base class with `@Published` properties and its subclass are declared in different files,
     mutating a published property from a subclass method for `self` (implicitly or explicitly) will result into Xcode build crash for some reason:

         Abort trap: 6
         Global is external, but doesn't have external or weak linkage!

     The crash is also reported [here](https://forums.swift.org/t/crash-when-extension-changes-published-from-separate-file/33224).

     However, there's no crash if a property is mutated not for `self`, but for a separate variable of the same type.

     This computed property provides a convenient access to `self`, to avoid declaring a separate variable explicitly.

     ```
     // View file
     class SomeViewModel: ObservableObject {
         @Published var someString: String = ""
     }

     // ViewModel file
     class SomeViewModelImplementation: SomeViewModel {
         func someMethod() {
             someString = "" // build crash

             self.someString = "" // build crash

             let myself = self
             myself.someString = "" // OK

             viewModel.someString = "" // OK
         }
     }
     ```
    */
    var viewModel: Self { self }
}
