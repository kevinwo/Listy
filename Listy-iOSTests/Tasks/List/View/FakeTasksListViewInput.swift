//
//  FakeTasksListViewInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/21/18.
//

import UIKit
@testable import Listy_iOS

class FakeTasksListViewInput: TasksListViewInput {

    var presenter: TasksListPresenterInput!

    var tableView: UITableView! = UITableView(frame: .zero)
}
