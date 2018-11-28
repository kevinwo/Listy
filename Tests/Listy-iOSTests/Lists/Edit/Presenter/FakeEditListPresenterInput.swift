//
//  FakeEditListPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

@testable import Listy_iOS
@testable import ListyKit

class FakeEditListPresenterInput: EditListPresenterInput {

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
