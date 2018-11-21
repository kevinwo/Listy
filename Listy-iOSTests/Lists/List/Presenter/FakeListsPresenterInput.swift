//
//  FakeListsPresenterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS

final class FakeListsPresenterInput: ListsPresenterInput {

    weak var view: ListsViewController!

    var didCallReloadData: Bool = false
    var didCallAddList: Bool = false
    var didCallLoadData: Bool = false
    var didCallHandleActionForSelectedRow: Bool = false
    var didDeleteList: Bool = false
    var deletedListIndexPath: IndexPath?
    var tableViewWithLoadedData: UITableView?

    init(view: ListsViewController) {
        self.view = view
    }

    func reloadData() {
        self.didCallReloadData = true
    }

    func addList() {
        self.didCallAddList = true
    }

    func loadData(into tableView: UITableView) {
        self.didCallLoadData = true
        self.tableViewWithLoadedData = tableView
    }

    func handleActionForSelectedRow(at indexPath: IndexPath) {
        self.didCallHandleActionForSelectedRow = true
    }

    func deleteList(at indexPath: IndexPath) {
        self.didDeleteList = true
        self.deletedListIndexPath = indexPath
    }
}
