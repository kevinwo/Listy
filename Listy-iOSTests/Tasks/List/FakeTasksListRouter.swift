//
//  FakeTasksListRouter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeTasksListRouter: TasksListRouter {

    var didShowEditTaskView: Bool = false

    override func showEditTaskView(with: Task) {
        self.didShowEditTaskView = true
    }
}
