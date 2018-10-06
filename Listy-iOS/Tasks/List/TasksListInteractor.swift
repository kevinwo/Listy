//
//  TasksListInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class TasksListInteractor {

    // MARK: - Properties

    var output: TasksListPresenter!
    var dataSource: TableViewDataSource!
    var tasks: Tasks!
    var list: List!

    init(output: TasksListPresenter) {
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
        self.dataSource.objects = self.tasks.all()
        self.output.updateView()
    }

    func newTask() -> Task {
        let task = Task()
        task.listId = list.id

        return task
    }
}
