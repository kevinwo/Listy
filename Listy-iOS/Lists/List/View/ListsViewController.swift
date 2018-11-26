//
//  ListsViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class ListsViewController: UITableViewController {

    // MARK: - Properties

    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!

    var dataSource: TableViewDataSource!
    var presenter: ListsPresenterInput!

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = TableViewDataSource()
        self.tableView.dataSource = self.dataSource

        self.presenter.reloadData()
    }

    // MARK: - Button actions

    @IBAction func addBarButtonItemTapped(_ sender: Any) {
        self.presenter.addList()
    }
}

// MARK: - UITableViewDelegate

extension ListsViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let list = self.dataSource.object(at: indexPath) as? List {
            self.presenter.showTasks(for: list)
        }
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            if let list = self.dataSource.object(at: indexPath) as? List {
                self.presenter.deleteList(list, at: indexPath)
            }
        }

        return [delete]
    }
}

extension ListsViewController: ListsPresenterOutput {

    func updateView(lists: [List]) {
        self.dataSource.sections = [lists]
        self.dataSource.cellConfigurationBlock = { (cell, object) in
            let list = (object as! List)
            cell.textLabel!.text = list.title
        }
        self.tableView.reloadData()
    }

    func deleteRow(at indexPath: IndexPath) {
        self.dataSource.sections[indexPath.section].remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension ListsViewController: ListsRouterOutput {

    func pushTasksListView(_ controller: TasksListViewController) {
        self.navigationController!.pushViewController(controller, animated: true)
    }

    func reloadData() {
        self.presenter.reloadData()
    }
}
