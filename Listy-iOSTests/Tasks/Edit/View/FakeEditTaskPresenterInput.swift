//
//  FakeEditTaskPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/17/18.
//

@testable import Listy_iOS

class FakeEditTaskPresenterInput: EditTaskPresenterInput {

    var router: EditTaskRouterInput!
    var interactor: EditTaskInteractorInput!

    var didCallViewDidLoad: Bool = false
    var didCallCancel: Bool = false
    var didCallSave: Bool = false

    func viewDidLoad() {
        self.didCallViewDidLoad = true
    }

    func cancel() {
        self.didCallCancel = true
    }

    func save(title: String?) {
        self.didCallSave = true
    }
}
