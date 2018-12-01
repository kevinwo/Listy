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

    var tableViewDataSource: TableViewDataSource!
    var tableViewDelegate: NSTableViewDelegate!

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.tableViewDataSource = TableViewDataSource()
        self.tableViewDelegate = ListsViewTableViewDelegate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self.tableViewDataSource
        self.tableView.delegate = self.tableViewDelegate

        self.tableView.reloadData()
    }
}
