//
//  FakeTasksListInteractorInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import Foundation
@testable import Listy_iOS
@testable import ListyKit

class FakeTasksListInteractorInput: TasksListInteractorInput {

    var output: TasksListInteractorOutput!
    var list: List

    var didCallLoadDataSource: Bool = false
    var didCallFetchData: Bool = false
    var didCallDeleteTaskAtIndexPath: Bool = false

    var taskToDelete: Task?
    var deletedTaskAtIndexPath: IndexPath?

    required init(list: List) {
        self.list = list
    }

    func newTask() -> Task {
        return Task()
    }

    func deleteTask(_ task: Task, at indexPath: IndexPath) {
        self.didCallDeleteTaskAtIndexPath = true
        self.taskToDelete = task
        self.deletedTaskAtIndexPath = indexPath
    }

    func fetchData() {
        self.didCallFetchData = true
    }
}
