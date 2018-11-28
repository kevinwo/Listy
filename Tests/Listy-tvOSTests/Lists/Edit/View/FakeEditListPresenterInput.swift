//
//  FakeEditListPresenterInput.swift
//  Listy-tvOSTests
//
//  Created by Kevin Wolkober on 11/28/18.
//

@testable import ListyKit

class FakeEditListPresenterInput: EditListPresenterInput {

    var output: EditListPresenterOutput!
    var router: EditListRouterInput!
    var interactor: EditListInteractorInput!

    var didCancel: Bool = false
    var didSave: Bool = false

    func cancel() {
        self.didCancel = true
    }

    func save(title: String?) {
        self.didSave = true
    }
}
