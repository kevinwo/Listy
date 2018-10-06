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

    init(output: ListsListPresenter) {
        self.output = output
        self.lists = Lists(database: Database.newInstance())
    }

    // MARK: - Public interface

    func loadDataSource(for tableView: UITableView, cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock) {
        self.dataSource = TableViewDataSource(tableView: tableView, cellConfigurationBlock: cellConfigurationBlock)
    }

    func fetchData() {
        self.dataSource.objects = self.lists.all()
        self.output.updateView()
    }

    func newList() -> List {
        return List()
    }

    func list(at indexPath: IndexPath) -> List {
        return (self.dataSource.object(at: indexPath) as! List)
    }
}
