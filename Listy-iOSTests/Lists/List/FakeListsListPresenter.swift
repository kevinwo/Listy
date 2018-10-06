//
//  FakeListsListPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS

class FakeListsListPresenter: ListsListPresenter {

    var didAddList: Bool = false

    override func addList() {
        self.didAddList = true
    }
}
