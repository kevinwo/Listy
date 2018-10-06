//
//  FakeEditTaskPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS

class FakeEditTaskPresenter: EditTaskPresenter {

    var didCancel: Bool = false
    var didSave: Bool = false

    override func cancel() {
        self.didCancel = true
    }

    override func save() {
        self.didSave = true
    }
}
