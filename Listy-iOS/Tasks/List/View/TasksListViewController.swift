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

final class TasksListViewController: UITableViewController {

    var addBarButtonItem: UIBarButtonItem!
    var tableViewDataSource: TableViewDataSource
    var presenter: TasksListPresenterInput!

    // MARK: - Object life cycle

    required init?(coder decoder: NSCoder) {
        self.tableViewDataSource = TableViewDataSource()

        super.init(coder: decoder)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonItemTapped(_:)))
        self.navigationItem.rightBarButtonItem = self.addBarButtonItem

        self.tableView.dataSource = self.tableViewDataSource

        self.presenter.reloadData()
    }

    // MARK: - Button actions

    @objc func addBarButtonItemTapped(_ sender: Any) {
        self.presenter.addTask()
    }
}

// MARK: - UITableViewDelegate

extension TasksListViewController {

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            if let task = self.tableViewDataSource.object(at: indexPath) as? Task {
                self.presenter.deleteTask(task, at: indexPath)
            }
        }

        return [delete]
    }
}

extension TasksListViewController: TasksListPresenterOutput {

    func updateView(title: String, tasks: [Task]) {
        self.title = title
        self.tableViewDataSource.sections = [tasks]
        self.tableViewDataSource.cellConfigurationBlock = { (cell, object) in
            let task = (object as! Task)
            cell.textLabel!.text = task.title
        }
        self.tableView.reloadData()
    }

    func deleteRow(at indexPath: IndexPath) {
        self.tableViewDataSource.sections[indexPath.section].remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension TasksListViewController: TasksListRouterOutput {

    func reloadData() {
        self.presenter.reloadData()
    }
}
