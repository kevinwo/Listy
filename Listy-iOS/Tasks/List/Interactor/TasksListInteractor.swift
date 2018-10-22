//
//  TasksListInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class TasksListInteractor: TasksListInteractorInput {

    // MARK: - Properties

    var output: TasksListInteractorOutput!
    var dataSource: TableViewDataSource!
    var tasks: Tasks!
    var list: List!

    required init(output: TasksListInteractorOutput) {
        self.output = output
        self.tasks = Tasks(database: Database.newInstance())
    }

    // MARK: - Public interface

    func loadDataSource(
        for tableView: UITableView,
        with list: List,
        cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock) {
        self.list = list
        self.dataSource = TableViewDataSource(tableView: tableView, cellConfigurationBlock: cellConfigurationBlock)
    }

    func fetchData() {
        self.dataSource.sections = [self.tasks.inList(self.list)]
        self.output.updateView()
    }

    func newTask() -> Task {
        let task = Task()
        task.listId = list.id

        return task
    }

    func deleteTask(at indexPath: IndexPath) {
        let task = self.dataSource.object(at: indexPath) as! Task

        do {
            try self.tasks.delete(task)
            self.dataSource.sections[indexPath.section].remove(at: indexPath.row)
            self.output.deleteRow(at: indexPath)
        } catch(let error) {
            self.output.showErrorAlert(for: error)
        }
    }
}
