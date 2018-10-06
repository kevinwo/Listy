//
//  TasksListViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyKit

class TasksListViewController: UITableViewController {

    var addBarButtonItem: UIBarButtonItem!

    var presenter: TasksListPresenter!
    var list: List!

    // MARK: Object lifecycle

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)

        self.presenter = TasksListPresenter(view: self)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonItemTapped(_:)))
        self.navigationItem.rightBarButtonItem = self.addBarButtonItem

        self.title = list.title
        self.presenter.viewDidLoad()
    }

    // MARK: - Button actions

    @objc func addBarButtonItemTapped(_ sender: Any) {
        self.presenter.addTask()
    }
}
