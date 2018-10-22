//
//  TasksListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class TasksListPresenter: TasksListPresentable {

    weak var view: TasksListViewable!
    var router: TasksListRouterInput
    lazy var interactor: TasksListInteractorInput = {
        return TasksListInteractor(output: self)
    }()

    required init(view: TasksListViewable) {
        self.view = view
        self.router = TasksListRouter(view: view)
    }

    // MARK: - Public interface

    func viewDidLoad() {
        self.interactor.loadDataSource(
        for: self.view.tableView, with: self.view.list) { (cell, object) in
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

    func updateView() {
        self.view.tableView.reloadData()
    }

    func deleteRow(at indexPath: IndexPath) {
        self.view.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}