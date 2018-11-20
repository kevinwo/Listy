//
//  FakeListsListRouter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeListsListRouter: ListsRouter {

    var didShowEditListView: Bool = false
    var didShowTasks: Bool = false
    var didShowTasksList: List?

    override func showEditListView(with: List) {
        self.didShowEditListView = true
    }

    override func showTasks(for list: List) {
        self.didShowTasks = true
        self.didShowTasksList = list
    }
}
