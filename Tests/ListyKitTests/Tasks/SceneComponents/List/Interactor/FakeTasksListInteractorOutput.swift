//
//  FakeTasksListInteractorOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/20/18.
//

import Foundation
@testable import Listy_iOS
@testable import ListyKit

class FakeTasksListInteractorOutput: TasksListInteractorOutput {

    var didCallUpdateView: Bool = false
    var didCallDeleteRow: Bool = false
    var updateViewList: List?
    var updateViewTasks: [Task]?
    var deletedRowIndexPath: IndexPath?

    func updateView(tasks: [Task], list: List) {
        self.didCallUpdateView = true
        self.updateViewTasks = tasks
        self.updateViewList = list
    }

    func deleteRow(at indexPath: IndexPath) {
        self.didCallDeleteRow = true
        self.deletedRowIndexPath = indexPath
    }

    func failedToDeleteTask(with error: NSError) {}
}
