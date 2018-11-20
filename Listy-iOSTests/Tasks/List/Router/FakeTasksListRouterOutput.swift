//
//  FakeTasksListRouterOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/20/18.
//

import Foundation
@testable import Listy_iOS
@testable import ListyUI

class FakeTasksListRouterOutput: TasksListRouterOutput {

    var didCallReloadData: Bool = false
    var didCallPresentView: Bool = false
    var didCallDismissView: Bool = false
    var presentedView: ViewRoutable?

    func reloadData() {
        self.didCallReloadData = true
    }

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {
        self.didCallPresentView = true
        self.presentedView = view
    }

    func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        self.didCallDismissView = true
    }
}
