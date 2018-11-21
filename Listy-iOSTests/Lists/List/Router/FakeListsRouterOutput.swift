//
//  FakeListsRouterOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/21/18.
//

import Foundation
@testable import Listy_iOS
@testable import ListyUI

class FakeListsRouterOutput: ListsRouterOutput {

    var didCallPushTasksListView: Bool = false
    var didCallReloadData: Bool = false
    var didCallPresentView: Bool = false
    var didCallDismissView: Bool = false
    var pushedTasksListView: TasksListViewController?
    var presentedView: ViewRoutable?

    func pushTasksListView(_ controller: TasksListViewController) {
        self.pushedTasksListView = controller
        self.didCallPushTasksListView = true
    }

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
