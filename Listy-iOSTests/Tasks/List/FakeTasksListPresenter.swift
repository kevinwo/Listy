//
//  FakeTasksListPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS

class FakeTasksListPresenter: TasksListPresenter {

    var didCallViewDidLoad: Bool = false

    override func viewDidLoad() {
        self.didCallViewDidLoad = true
    }
}
