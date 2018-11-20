//
//  TasksListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class TasksListPresenter: TasksListPresenterInput {

    weak var output: TasksListPresenterOutput!
    var router: TasksListRouterInput!
    var interactor: TasksListInteractorInput!

    required init() {}

    // MARK: - Public interface

    func loadData(into tableView: UITableView) {
        self.interactor.loadDataSource(
        for: tableView) { (cell, object) in
            let task = (object as! Task)
            cell.textLabel!.text = task.title
        }

        reloadData()
    }

    func reloadData() {
        self.interactor.fetchData()
    }

    func addTask() {
        let task = self.interactor.newTask()
        self.router.showEditTaskView(with: task)
    }

    func deleteTask(at indexPath: IndexPath) {
        self.interactor.deleteTask(at: indexPath)
    }
}

extension TasksListPresenter: TasksListInteractorOutput {
    func updateView(list: List) {
        self.output.updateView(title: list.title)
    }

    func deleteRow(at indexPath: IndexPath) {
        self.output.deleteRow(at: indexPath)
    }
}
