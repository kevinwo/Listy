//
//  FakeEditTaskPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/17/18.
//

@testable import Listy_iOS

class FakeEditTaskPresenter: EditTaskPresenter {

    var didCallCancel: Bool = false
    var didCallSave: Bool = false

    override func cancel() {
        self.didCallCancel = true
    }

    override func save() {
        self.didCallSave = true
    }
}
