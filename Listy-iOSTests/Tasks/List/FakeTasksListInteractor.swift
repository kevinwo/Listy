//
//  FakeTasksListInteractor.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class FakeTasksListInteractor: TasksListInteractor {

    var didCallLoadDataSource: Bool = false
    var didCallFetchData: Bool = false

    override func loadDataSource(
        for tableView: UITableView,
        with list: List,
        cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock) {
        self.didCallLoadDataSource = true
    }

    override func fetchData() {
        self.didCallFetchData = true
    }
}
