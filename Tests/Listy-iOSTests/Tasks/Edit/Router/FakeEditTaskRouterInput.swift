//
//  FakeEditTaskRouterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/27/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeEditTaskRouterInput: EditTaskRouterInput {

    var view: EditTaskRouterOutput!
    var didCallFinishWithCancel: Bool = false
    var didCallFinishWithSaving: Bool = false
    var taskDidFinishWithSaving: Task?

    func finishWithCancel() {
        self.didCallFinishWithCancel = true
    }

    func finishWithSaving(_ task: Task) {
        self.didCallFinishWithSaving = true
        self.taskDidFinishWithSaving = task
    }
}
