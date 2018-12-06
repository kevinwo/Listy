//
//  ListsPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

public final class ListsPresenter: ListsPresenterInput {

    public weak var output: ListsPresenterOutput!
    public var router: ListsRouterInput!
    public var interactor: ListsInteractorInput!

    public init() {}

    // MARK: - ListsPresenterInput

    public func reloadData() {
        self.interactor.fetchData()
    }

    public func addList() {
        let list = self.interactor.newList()

        self.router.showEditListView(with: list)
    }

    public func showTasks(for list: List) {
        self.router.showTasks(for: list)
    }

    public func confirmDeleteList(_ list: List, confirmAction: @escaping () -> Void) {
        let alertTitle = "Are you sure you want to delete \(list.title)?"
        let alertConfirmActionTitle = "Confirm"
        let alertCancelActionTitle = "Cancel"

        self.router.showConfirmDeleteAlert(title: alertTitle, confirmActionTitle: alertConfirmActionTitle, cancelActionTitle: alertCancelActionTitle, confirmAction: confirmAction)
    }

    public func deleteList(_ list: List, at indexPath: IndexPath) {
        self.interactor.deleteList(list, at: indexPath)
    }

    #if os(macOS)
    public func save(title: String?) {
        self.interactor.saveList(title: title)
    }
    #endif
}

extension ListsPresenter: ListsInteractorOutput {

    public func updateView(lists: [List]) {
        self.output.updateView(lists: lists)
    }

    public func deleteRow(at indexPath: IndexPath) {
        self.output.deleteRow(at: indexPath)
    }

    public func failedToDeleteList(with error: NSError) {
        self.output.showErrorAlert(for: error)
    }

    #if os(macOS)
    public func failedToSaveList(with error: NSError) {
        self.output.showErrorAlert(for: error)
    }
    #endif
}
