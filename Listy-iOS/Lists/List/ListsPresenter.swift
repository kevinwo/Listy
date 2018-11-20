//
//  ListsListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class ListsPresenter {

    typealias T = ListsViewController

    weak var view: ListsViewController!
    var router: ListsRouter
    lazy var interactor = {
        ListsInteractor(output: self)
    }()

    required init(view: ListsViewController) {
        self.view = view
        self.router = ListsRouter(view: view)
    }

    // MARK: - Public interface

    func viewDidLoad() {
        self.interactor.loadDataSource(
        for: self.view.tableView) { (cell, object) in
            let list = (object as! List)
            cell.textLabel!.text = list.title
        }

        reloadData()
    }

    func reloadData() {
        self.interactor.fetchData()
    }

    func addList() {
        let list = self.interactor.newList()
        self.router.showEditListView(with: list)
    }

    func handleActionForSelectedRow(at indexPath: IndexPath) {
        let list = self.interactor.list(at: indexPath)
        self.router.showTasks(for: list)
    }

    func deleteList(at indexPath: IndexPath) {
        self.interactor.deleteList(at: indexPath)
    }

    // MARK: - Interactor output

    func updateView() {
        self.view.tableView.reloadData()
    }

    func deleteRow(at indexPath: IndexPath) {
        self.view.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension ListsPresenter: ErrorAlertable {}
