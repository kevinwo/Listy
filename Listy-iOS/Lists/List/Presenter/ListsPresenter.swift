//
//  ListsPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

final class ListsPresenter: ListsPresenterInput {

    weak var output: ListsPresenterOutput!
    var router: ListsRouterInput!
    var interactor: ListsInteractorInput!

    // MARK: - ListsPresenterInput

    func loadData(into tableView: UITableView) {
        self.interactor.loadDataSource(
        for: tableView) { (cell, object) in
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
}

extension ListsPresenter: ListsInteractorOutput {

    func updateView() {
        self.output.updateView()
    }

    func deleteRow(at indexPath: IndexPath) {
        self.output.deleteRow(at: indexPath)
    }
}
