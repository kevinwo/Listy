//
//  ListsPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyKit

final class ListsPresenter: ListsPresenterInput {

    weak var output: ListsPresenterOutput!
    var router: ListsRouterInput!
    var interactor: ListsInteractorInput!

    // MARK: - ListsPresenterInput

    func reloadData() {
        self.interactor.fetchData()
    }

    func addList() {
        let list = self.interactor.newList()
        self.router.showEditListView(with: list)
    }

    func showTasks(for list: List) {
        self.router.showTasks(for: list)
    }

    func deleteList(_ list: List, at indexPath: IndexPath) {
        self.interactor.deleteList(list, at: indexPath)
    }
}

extension ListsPresenter: ListsInteractorOutput {

    func updateView(lists: [List]) {
        self.output.updateView(lists: lists)
    }

    func deleteRow(at indexPath: IndexPath) {
        self.output.deleteRow(at: indexPath)
    }

    func failedToDeleteList(with error: NSError) {
        self.output.showErrorAlert(for: error)
    }
}
