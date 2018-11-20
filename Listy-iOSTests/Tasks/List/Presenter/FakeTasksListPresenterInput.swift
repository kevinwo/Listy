//
//  FakeTasksListPresenterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeTasksListPresenterInput: TasksListPresenterInput {

    var output: TasksListPresenterOutput!
    var router: TasksListRouterInput!
    var interactor: TasksListInteractorInput!

    var didCallLoadData: Bool = false
    var didCallReloadData: Bool = false
    var didCallAddTask: Bool = false
    var didCallDeleteTask: Bool = false
    var tableViewWithLoadedData: UITableView?

    required init() {}

    func loadData(into tableView: UITableView) {
        self.didCallLoadData = true
        self.tableViewWithLoadedData = tableView
    }

    func reloadData() {
        self.didCallReloadData = true
    }

    func addTask() {
        self.didCallAddTask = true
    }

    func deleteTask(at indexPath: IndexPath) {
        self.didCallDeleteTask = true
    }
}
