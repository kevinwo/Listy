//
//  FakeEditListPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS

class FakeEditListPresenter: EditListPresenter {

    var didCallShowErrorAlert: Bool = false
    var didCancel: Bool = false
    var didSave: Bool = false
    var didCallUpdateView: Bool = false

    override func showErrorAlert(_ error: Error) {
        self.didCallShowErrorAlert = true
    }

    override func cancel() {
        self.didCancel = true
    }

    override func save() {
        self.didSave = true
    }

    override func updateView() {
        self.didCallUpdateView = true
    }
}
