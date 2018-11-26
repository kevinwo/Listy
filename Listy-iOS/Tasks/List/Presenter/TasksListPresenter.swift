//
//  TasksListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyKit

final class TasksListPresenter: TasksListPresenterInput {

    weak var output: TasksListPresenterOutput!
    var router: TasksListRouterInput!
    var interactor: TasksListInteractorInput!

    // MARK: - Public interface

    func reloadData() {
        self.interactor.fetchData()
    }

    func addTask() {
        let task = self.interactor.newTask()
        self.router.showEditTaskView(with: task)
    }

    func deleteTask(_ task: Task, at indexPath: IndexPath) {
        self.interactor.deleteTask(task, at: indexPath)
    }
}

extension TasksListPresenter: TasksListInteractorOutput {

    func updateView(tasks: [Task], list: List) {
        self.output.updateView(title: list.title, tasks: tasks)
    }

    func deleteRow(at indexPath: IndexPath) {
        self.output.deleteRow(at: indexPath)
    }
}
