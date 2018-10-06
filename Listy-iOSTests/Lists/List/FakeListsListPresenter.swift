//
//  FakeListsListPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS

class FakeListsListPresenter: ListsListPresenter {

    var didCallAddList: Bool = false
    var didCallViewDidLoad: Bool = false
    var didCallUpdateView: Bool = false

    override func addList() {
        self.didCallAddList = true
    }

    override func viewDidLoad() {
        self.didCallViewDidLoad = true
    }

    override func updateView() {
        self.didCallUpdateView = true
    }
}
