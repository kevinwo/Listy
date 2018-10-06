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
    var didCallAddTask: Bool = false
    var didCallUpdateView: Bool = false
    var didCallReloadData: Bool = false

    override func viewDidLoad() {
        self.didCallViewDidLoad = true
    }

    override func reloadData() {
        self.didCallReloadData = true
    }

    override func addTask() {
        self.didCallAddTask = true
    }

    override func updateView() {
        self.didCallUpdateView = true
    }
}
