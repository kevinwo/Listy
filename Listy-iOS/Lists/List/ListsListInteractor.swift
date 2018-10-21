//
//  ListsListInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class ListsListInteractor {

    // MARK: - Properties

    var output: ListsListPresenter!
    var dataSource: TableViewDataSource!
    var lists: Lists
    var tasks: Tasks

    init(output: ListsListPresenter) {
        self.output = output

        let database = Database.newInstance()
        self.lists = Lists(database: database)
        self.tasks = Tasks(database: database)
    }

    // MARK: - Public interface

    func loadDataSource(for tableView: UITableView, cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock) {
        self.dataSource = TableViewDataSource(tableView: tableView, cellConfigurationBlock: cellConfigurationBlock)
    }

    func fetchData() {
        self.dataSource.sections = [self.lists.all()]
        self.output.updateView()
    }

    func newList() -> List {
        return List()
    }

    func list(at indexPath: IndexPath) -> List {
        return (self.dataSource.object(at: indexPath) as! List)
    }

    func deleteList(at indexPath: IndexPath) {
        let list = self.dataSource.object(at: indexPath) as! List
        let tasksInList = self.tasks.inList(list)

        do {
            for task in tasksInList {
                try self.tasks.delete(task)
            }

            try self.lists.delete(list)
            self.dataSource.sections[indexPath.section].remove(at: indexPath.row)
            self.output.deleteRow(at: indexPath)
        } catch(let error) {
            self.output.showErrorAlert(for: error)
        }
    }
}
