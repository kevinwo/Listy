//
//  ListsListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class ListsListPresenter: Presenter {

    weak var view: ListsListViewController!
    var router: ListsListRouter
    var interactor: ListsListInteractor!

    init(view: ListsListViewController) {
        self.view = view
        self.router = ListsListRouter(view: view)

        super.init()

        self.interactor = ListsListInteractor(output: self)
    }

    // MARK: - Public interface

    override func viewDidLoad() {
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
