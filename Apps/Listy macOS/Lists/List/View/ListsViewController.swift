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

    // MARK: - Button actions

    @IBAction func addListButtonTapped(_ sender: Any) {
        self.presenter.addList()
    }
}

extension ListsViewController: ListsPresenterOutput {

    func updateView(lists: [List]) {
        self.tableViewDataSource.objects = lists
        self.tableViewDelegate.cellConfigurationBlock = { [unowned self] (cellView, row) in
            if let list = self.tableViewDataSource.object(for: row) as? List {
                cellView.textField?.stringValue = list.title
                cellView.textField?.delegate = self
            }
        }

        self.tableView.reloadData()
    }

    func deleteRow(at indexPath: IndexPath) {}
}

extension ListsViewController: ListsRouterOutput {

    func addRow(with list: List) {
        self.tableViewDataSource.objects.append(list)
        self.tableView.reloadData()
    }

    func reloadData() {}
}

extension ListsViewController: NSTextFieldDelegate {

    func controlTextDidEndEditing(_ obj: Notification) {
        if let textField = obj.object as? NSTextField {
            self.presenter.save(title: textField.stringValue)
        }
    }
}
