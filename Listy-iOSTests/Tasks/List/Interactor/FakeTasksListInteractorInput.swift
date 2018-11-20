//
//  FakeTasksListInteractorInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class FakeTasksListInteractorInput: TasksListInteractorInput {

    var output: TasksListInteractorOutput!
    var list: List

    var didCallDeleteTaskAtIndexPath: Bool = false
    var deletedTaskAtIndexPath: IndexPath?
    var didCallLoadDataSource: Bool = false
    var didCallFetchData: Bool = false

    required init(list: List) {
        self.list = list
    }

    func newTask() -> Task {
        return Task()
    }

    func deleteTask(at indexPath: IndexPath) {
        self.didCallDeleteTaskAtIndexPath = true
        self.deletedTaskAtIndexPath = indexPath
    }

    func loadDataSource(
        for tableView: UITableView,
        cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock) {
        self.didCallLoadDataSource = true
    }

    func fetchData() {
        self.didCallFetchData = true
    }
}
