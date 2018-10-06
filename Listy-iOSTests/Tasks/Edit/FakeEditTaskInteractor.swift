//
//  FakeEditTaskInteractor.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS

class FakeEditTaskInteractor: EditTaskInteractor {

    var didCallSaveTask: Bool = false

    override func saveTask(title: String) {
        self.didCallSaveTask = true
    }
}
