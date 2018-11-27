//
//  FakeTasksListPresenterOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/20/18.
//

import Foundation
@testable import Listy_iOS
@testable import ListyKit

class FakeTasksListPresenterOutput: TasksListPresenterOutput {

    var presenter: TasksListPresenterInput!

    var didCallUpdateView: Bool = false
    var didCallDeleteRow: Bool = false
    var updateViewTitle: String?
    var updateViewTasks: [Task]?
    var deletedRowIndexPath: IndexPath?

    func updateView(title: String, tasks: [Task]) {
        self.didCallUpdateView = true
        self.updateViewTitle = title
        self.updateViewTasks = tasks
    }

    func deleteRow(at indexPath: IndexPath) {
        self.didCallDeleteRow = true
    }

    func showErrorAlert(for error: NSError) {}
}
