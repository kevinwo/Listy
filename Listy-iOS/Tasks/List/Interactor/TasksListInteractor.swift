//
//  TasksListInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyKit

class TasksListInteractor: TasksListInteractorInput {

    // MARK: - Properties

    var output: TasksListInteractorOutput!
    var tasks: Tasks
    var list: List

    required init(list: List) {
        self.list = list
        self.tasks = Tasks(database: Database.newInstance())
    }

    func fetchData() {
        let fetchedTasks = self.tasks.inList(self.list)
        self.output.updateView(tasks: fetchedTasks, list: self.list)
    }

    func newTask() -> Task {
        let task = Task()
        task.listId = list.id

        return task
    }

    func deleteTask(_ task: Task, at indexPath: IndexPath) {
        do {
            try self.tasks.delete(task)
            self.output.deleteRow(at: indexPath)
        } catch(let error) {
            self.output.showErrorAlert(for: error)
        }
    }
}
