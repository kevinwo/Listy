//
//  ListsViewController.swift
//  Listy macOS
//
//  Created by Kevin Wolkober on 11/30/18.
//

import Cocoa
import ListyKit

class ListsViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var addListButton: NSButton!

    var presenter: ListsPresenterInput!
    var tableViewDataSource: TableViewDataSource!
    var tableViewDelegate: NSTableViewDelegate!

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.tableViewDataSource = TableViewDataSource()
        self.tableViewDelegate = ListsViewTableViewDelegate()

        let database = Database.newInstance()
        let lists = Lists(database: database)
        let tasks = Tasks(database: database)

        ListsRouter.setScene(for: self, lists: lists, tasks: tasks)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self.tableViewDataSource
        self.tableView.delegate = self.tableViewDelegate

        self.presenter.reloadData()
    }
}

extension ListsViewController: ListsPresenterOutput {

    public func updateView(lists: [List]) {}

    public func deleteRow(at indexPath: IndexPath) {}
}

extension ListsViewController: ListsRouterOutput {

    public func reloadData() {}
}
