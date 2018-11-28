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

    var tableViewDataSource: TableViewDataSource
    var tableViewDelegate: ListsViewTableViewDelegate
    var presenter: ListsPresenterInput!

    required init?(coder decoder: NSCoder) {
        self.tableViewDataSource = TableViewDataSource()
        self.tableViewDelegate = ListsViewTableViewDelegate()

        super.init(coder: decoder)
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self.tableViewDataSource
        self.tableView.delegate = self.tableViewDelegate

        self.presenter.reloadData()
    }

    // MARK: - Button actions

    @IBAction func addBarButtonItemTapped(_ sender: Any) {
        self.presenter.addList()
    }
}

extension ListsViewController: ListsPresenterOutput {

    func updateView(lists: [List]) {
        self.tableViewDataSource.sections = [lists]
        self.tableViewDataSource.cellConfigurationBlock = { (cell, object) in
            let list = (object as! List)
            cell.textLabel!.text = list.title
        }
        self.tableViewDelegate.didSelectRowHandler = { [unowned self] (indexPath) in
            if let list = self.tableViewDataSource.object(at: indexPath) as? List {
                self.presenter.showTasks(for: list)
            }
        }
        self.tableViewDelegate.deleteRowHandler = { [unowned self] (indexPath) in
            if let list = self.tableViewDataSource.object(at: indexPath) as? List {
                self.presenter.deleteList(list, at: indexPath)
            }
        }
        self.tableView.reloadData()
    }

    func deleteRow(at indexPath: IndexPath) {
        self.tableViewDataSource.sections[indexPath.section].remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension ListsViewController: ListsRouterOutput {

    func reloadData() {
        self.presenter.reloadData()
    }
}
