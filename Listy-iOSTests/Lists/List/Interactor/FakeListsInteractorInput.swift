//
//  FakeListsInteractorInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class FakeListsInteractorInput: ListsInteractorInput {

    weak var output: ListsInteractorOutput!
    var lists: Lists!
    var tasks: Tasks!

    var didCallLoadDataSource: Bool = false
    var didCallFetchData: Bool = false
    lazy var testList: List = {
        let list = List()
        list.title = "Cool List"
        return list
    }()
    var didCallDeleteList: Bool = false
    var deletedListIndexPath: IndexPath?

    init(lists: Lists, tasks: Tasks) {
        self.lists = lists
        self.tasks = tasks
    }

    func loadDataSource(for tableView: UITableView, cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock) {
        self.didCallLoadDataSource = true
    }

    func fetchData() {
        self.didCallFetchData = true
    }

    func list(at indexPath: IndexPath) -> List {
        return self.testList
    }

    func newList() -> List {
        return List()
    }

    func deleteList(at indexPath: IndexPath) {
        self.didCallDeleteList = true
        deletedListIndexPath = indexPath
    }
}
