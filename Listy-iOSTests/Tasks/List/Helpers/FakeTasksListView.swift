//
//  FakeTasksListView.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/21/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class FakeTasksListView: TasksListViewable {

    var tableView: UITableView! = UITableView(frame: .zero)
    var list: List! = List()
    var didCallReloadData: Bool = false
    var didCallPresentView: Bool = false
    var didCallDismissView: Bool = false
    var presentedView: UIViewController!

    func reloadData() {
        self.didCallReloadData = true
    }

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {
        self.didCallPresentView = true
        self.presentedView = (view as! UINavigationController).topViewController
    }

    func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        self.didCallDismissView = true
    }
}
