//
//  ListsViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit

class ListsViewController: UITableViewController {

    // MARK: - Properties

    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!

    var presenter: ListsPresenterInput!

    // MARK: - Object lifecycle

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)

        self.presenter = ListsPresenter(output: self, view: self)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.loadData(into: self.tableView)
    }

    // MARK: - Button actions

    @IBAction func addBarButtonItemTapped(_ sender: Any) {
        self.presenter.addList()
    }
}

// MARK: - UITableViewDelegate

extension ListsViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.handleActionForSelectedRow(at: indexPath)
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.presenter.deleteList(at: indexPath)
        }

        return [delete]
    }
}

extension ListsViewController: ListsPresenterOutput {
    func updateView() {
        self.tableView.reloadData()
    }

    func deleteRow(at indexPath: IndexPath) {
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
