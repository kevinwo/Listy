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
    var tableViewDelegate: TasksListViewTableViewDelegate
    var presenter: TasksListPresenterInput!

    // MARK: - Object life cycle

    required init?(coder decoder: NSCoder) {
        self.tableViewDataSource = TableViewDataSource()
        self.tableViewDelegate = TasksListViewTableViewDelegate()

        super.init(coder: decoder)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonItemTapped(_:)))
        self.navigationItem.rightBarButtonItem = self.addBarButtonItem

        self.tableView.dataSource = self.tableViewDataSource
        self.tableView.delegate = self.tableViewDelegate

        self.presenter.reloadData()
    }

    // MARK: - Button actions

    @objc func addBarButtonItemTapped(_ sender: Any) {
        self.presenter.addTask()
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
        self.tableViewDelegate.deleteRowHandler = { [unowned self] (indexPath) in
            if let task = self.tableViewDataSource.object(at: indexPath) as? Task {
                self.presenter.deleteTask(task, at: indexPath)
            }
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
