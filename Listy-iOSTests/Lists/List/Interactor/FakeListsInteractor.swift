//
//  FakeListsInteractor.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class FakeListsInteractor: ListsInteractor {

    var didCallLoadDataSource: Bool = false
    var didCallFetchData: Bool = false
    lazy var testList: List = {
        let list = List()
        list.title = "Cool List"
        return list
    }()

    override func loadDataSource(for tableView: UITableView, cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock) {
        self.didCallLoadDataSource = true
    }

    override func fetchData() {
        self.didCallFetchData = true
    }

    override func list(at indexPath: IndexPath) -> List {
        return self.testList
    }
}
