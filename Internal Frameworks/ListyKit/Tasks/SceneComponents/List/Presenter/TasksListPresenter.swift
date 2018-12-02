//
//  TasksListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

public final class TasksListPresenter: TasksListPresenterInput {

    // MARK: - Properties

    public weak var output: TasksListPresenterOutput!
    public var router: TasksListRouterInput!
    public var interactor: TasksListInteractorInput!

    // MARK: - Object life cycle

    public init() {}

    // MARK: - TasksListPresenterInput

    public func reloadData() {
        self.interactor.fetchData()
    }

    public func addTask() {
        let task = self.interactor.newTask()
        self.router.showEditTaskView(with: task)
    }

    public func deleteTask(_ task: Task, at indexPath: IndexPath) {
        self.interactor.deleteTask(task, at: indexPath)
    }
}

extension TasksListPresenter: TasksListInteractorOutput {

    public func updateView(tasks: [Task], list: List) {
        self.output.updateView(title: list.title, tasks: tasks)
    }

    public func deleteRow(at indexPath: IndexPath) {
        self.output.deleteRow(at: indexPath)
    }

    public func failedToDeleteTask(with error: NSError) {
        self.output.showErrorAlert(for: error)
    }
}
