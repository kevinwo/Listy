//
//  FakeEditTaskPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeEditTaskPresenter: EditTaskPresenter {

    var didCallShowErrorAlert: Bool = false
    var didCancel: Bool = false
    var didSave: Bool = false
    var didCallFinish: Bool = false

    func showErrorAlert(_ error: Error) {
        self.didCallShowErrorAlert = true
    }

    override func cancel() {
        self.didCancel = true
    }

    override func save() {
        self.didSave = true
    }

    override func finish(with task: Task) {
        self.didCallFinish = true
    }
}
