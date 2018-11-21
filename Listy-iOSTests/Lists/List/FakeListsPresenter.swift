//
//  FakeListsPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS

class FakeListsPresenter: ListsPresenter {

    var didCallReloadData: Bool = false
    var didCallAddList: Bool = false
    var didCallViewDidLoad: Bool = false
    var didCallHandleActionForSelectedRow: Bool = false

    override func reloadData() {
        self.didCallReloadData = true
    }

    override func addList() {
        self.didCallAddList = true
    }

    override func viewDidLoad() {
        self.didCallViewDidLoad = true
    }

    override func handleActionForSelectedRow(at indexPath: IndexPath) {
        self.didCallHandleActionForSelectedRow = true
    }
}
