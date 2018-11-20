//
//  ListsListViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit

class ListsViewController: UITableViewController {

    // MARK: - Properties

    @IBOutlet weak var addBarButtonItem: UIBarButtonItem!

    var presenter: ListsListPresenter!

    // MARK: - Object lifecycle

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)

        self.presenter = ListsListPresenter(view: self)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.viewDidLoad()
    }

    // MARK: - Public interface

    func reloadData() {
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