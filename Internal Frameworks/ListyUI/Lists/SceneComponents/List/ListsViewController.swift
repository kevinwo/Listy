//
//  ListsViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyKit

public final class ListsViewController: UITableViewController {

    // MARK: - Properties

    @IBOutlet public weak var addBarButtonItem: UIBarButtonItem!

    public var presenter: ListsPresenterInput!
    internal var tableViewDataSource: TableViewDataSource
    internal var tableViewDelegate: ListsViewTableViewDelegate

    public required init?(coder decoder: NSCoder) {
        self.tableViewDataSource = TableViewDataSource()
        self.tableViewDelegate = ListsViewTableViewDelegate()

        super.init(coder: decoder)
    }

    // MARK: - View lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self.tableViewDataSource
        self.tableView.delegate = self.tableViewDelegate

        #if os(tvOS)
        let playButtonTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(playButtonTapped(_:)))
        playButtonTapRecognizer.allowedPressTypes = [NSNumber(value: UIPress.PressType.playPause.rawValue)];
        self.view.addGestureRecognizer(playButtonTapRecognizer)
        #endif

        self.presenter.reloadData()
    }

    // MARK: - Actions

    @IBAction func addBarButtonItemTapped(_ sender: Any) {
        self.presenter.addList()
    }

    #if os(tvOS)
    @objc func playButtonTapped(_ sender: Any) {
        if let indexPath = self.tableViewDelegate.focusedIndexPath, let list = self.tableViewDataSource.object(at: indexPath) as? List {
            self.presenter.confirmDeleteList(list) {
                self.presenter.deleteList(list, at: indexPath)
            }
        }
    }
    #endif
}

extension ListsViewController: ListsPresenterOutput {

    public func updateView(lists: [List]) {
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

    public func deleteRow(at indexPath: IndexPath) {
        self.tableViewDataSource.sections[indexPath.section].remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension ListsViewController: ListsRouterOutput {

    public func reloadData() {
        self.presenter.reloadData()
    }
}
