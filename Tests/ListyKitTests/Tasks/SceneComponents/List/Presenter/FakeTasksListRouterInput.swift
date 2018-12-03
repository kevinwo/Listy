//
//  FakeTasksListRouterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import ListyKit

class FakeTasksListRouterInput: TasksListRouterInput {

    weak var output: TasksListRouterOutput!

    var didShowEditTaskView: Bool = false
    var taskForShowEditTaskView: Task?

    func showEditTaskView(with task: Task) {
        self.didShowEditTaskView = true
        self.taskForShowEditTaskView = task
    }
}
