//
//  FakeListsListInteractor.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyUI

class FakeListsListInteractor: ListsListInteractor {

    var didCallLoadDataSource: Bool = false

    override func loadDataSource(for tableView: UITableView, cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock) {
        self.didCallLoadDataSource = true
    }
}
