//
//  FakeTasksListRouterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeTasksListRouterInput: TasksListRouterInput {

    weak var output: TasksListRouterOutput!

    static var didCallScene: Bool = false
    var didShowEditTaskView: Bool = false
    var taskForShowEditTaskView: Task?

    static func scene(list: List) -> TasksListViewController {
        self.didCallScene = true

        return TasksListViewController(nibName: nil, bundle: nil)
    }

    func showEditTaskView(with task: Task) {
        self.didShowEditTaskView = true
        self.taskForShowEditTaskView = task
    }
}
