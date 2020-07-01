# Rivora

Rivora is a playground project to investigate SwiftUI best practices.

* [`ObservableObject`](https://developer.apple.com/documentation/combine/observableobject) is replaced with [`ObservableModel`](https://gist.github.com/dtrofimov/1d84abb80314fa81aa50ea7ee5c9788a) to use a dependency inversion principle (to cover a view model with a protocol). See `PersonList` screen as a simple example.
* An example of programmatic navigation is implemented. See `ProgrammaticNavigationExample` screen.
* An alternative version of MVVM is implemented (named PublisherMVVM), with individual observables (aka publisher) for different model fields, to avoid the whole view reloading on separate field updates. See `PublisherMVVMExample` screen. The result seems to be too verbose, the same optimization effect may be reached by decomposing the view to smaller views with individual view models.
* [Introspect](https://github.com/siteline/SwiftUI-Introspect) library features are investigated and slightly extended. See `ListStylingDemo` screen.
