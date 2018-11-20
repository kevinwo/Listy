//
//  TasksListViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyUI
import ListyKit

class TasksListViewController: UITableViewController, TasksListViewInput {

    var addBarButtonItem: UIBarButtonItem!

    var presenter: TasksListPresenterInput!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonItemTapped(_:)))
        self.navigationItem.rightBarButtonItem = self.addBarButtonItem

        self.presenter.loadData(into: self.tableView)
    }

    // MARK: - Button actions

    @objc func addBarButtonItemTapped(_ sender: Any) {
        self.presenter.addTask()
    }
}

// MARK: - UITableViewDataSource

extension TasksListViewController {
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.presenter.deleteTask(at: indexPath)
        }

        return [delete]
    }
}

extension TasksListViewController: TasksListPresenterOutput {
    func updateView(title: String) {
        self.title = title
        self.tableView.reloadData()
    }

    func deleteRow(at indexPath: IndexPath) {
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension TasksListViewController: TasksListRouterOutput {
    func reloadData() {
        self.presenter.reloadData()
    }
}
