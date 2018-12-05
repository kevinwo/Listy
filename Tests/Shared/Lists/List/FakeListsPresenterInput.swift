//
//  FakeListsPresenterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

@testable import ListyKit

final class FakeListsPresenterInput: ListsPresenterInput {

    weak var output: ListsPresenterOutput!
    var router: ListsRouterInput!
    var interactor: ListsInteractorInput!

    var didCallReloadData: Bool = false
    var didCallAddList: Bool = false
    var didCallShowTasks: Bool = false
    var didCallConfirmDeleteList: Bool = false
    var didDeleteList: Bool = false

    var confirmDeleteList: List?
    var confirmDeleteAction: (() -> Void)?
    var deletedList: List?
    var deletedListIndexPath: IndexPath?
    var listWithTasksToShow: List?

    #if os(macOS)
    var didCallSaveList: Bool = false

    var saveListTitle: String?
    #endif

    func reloadData() {
        self.didCallReloadData = true
    }

    func addList() {
        self.didCallAddList = true
    }

    func showTasks(for list: List) {
        self.didCallShowTasks = true
        self.listWithTasksToShow =  list
    }

    func confirmDeleteList(_ list: List, confirmAction: @escaping () -> Void) {
        self.didCallConfirmDeleteList = true
        self.confirmDeleteList = list
        self.confirmDeleteAction = confirmAction
    }

    func deleteList(_ list: List, at indexPath: IndexPath) {
        self.didDeleteList = true
        self.deletedList = list
        self.deletedListIndexPath = indexPath
    }

    #if os(macOS)
    func save(title: String?) {
        self.didCallSaveList = true
        self.saveListTitle = title
    }
    #endif
}
