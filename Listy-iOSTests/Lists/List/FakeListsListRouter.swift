//
//  FakeListsListRouter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeListsListRouter: ListsListRouter {

    var didShowEditListView: Bool = false

    override func showEditListView(with: List) {
        self.didShowEditListView = true
    }
}
