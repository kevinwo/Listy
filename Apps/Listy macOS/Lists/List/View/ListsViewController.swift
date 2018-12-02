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
    var tableViewDelegate: ListsViewTableViewDelegate!

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

    public func updateView(lists: [List]) {
        self.tableViewDataSource.objects = lists
        self.tableViewDelegate.cellConfigurationBlock = { (cellView, row) in
            if let list = self.tableViewDataSource.object(for: row) as? List {
                cellView.textField?.stringValue = list.title
            }
        }

        self.tableView.reloadData()
    }

    public func deleteRow(at indexPath: IndexPath) {}
}

extension ListsViewController: ListsRouterOutput {

    public func reloadData() {}
}
