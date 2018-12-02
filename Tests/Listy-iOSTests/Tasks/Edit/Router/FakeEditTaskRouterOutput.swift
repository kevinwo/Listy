//
//  FakeEditTaskListView.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/19/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class FakeEditTaskRouterOutput: EditTaskRouterOutput {

    var didFinishWithCancel: Bool = false
    var didFinishWithSave: Bool = false
    var didCallPresentView: Bool = false
    var didCallPushView: Bool = false
    var didCallDismissView: Bool = false

    var presentedView: ViewRoutable!
    var pushedView: ViewRoutable?
    var savedTask: Task!

    func finishWithCancel() {
        self.didFinishWithCancel = true
    }

    func finishWithSaving(_ task: Task) {
        self.didFinishWithSave = true
        self.savedTask = task
    }

    // MARK: - ViewRoutable

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {
        self.didCallPresentView = true
        self.presentedView = view
    }

    func push(view: ViewRoutable, animated flag: Bool) {
        self.didCallPushView = true
        self.pushedView = view
    }

    func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        self.didCallDismissView = true
    }
}
