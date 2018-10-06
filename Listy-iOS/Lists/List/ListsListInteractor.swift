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

    init(output: ListsListPresenter) {
        self.output = output
    }

    // MARK: - Public interface

    func loadDataSource(for tableView: UITableView, cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock) {
        // Load some cool data
    }

    func newList() -> List {
        return List()
    }
}
