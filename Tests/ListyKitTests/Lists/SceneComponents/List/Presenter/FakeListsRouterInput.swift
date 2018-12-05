//
//  FakeListsRouterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/21/18.
//

@testable import ListyKit

class FakeListsRouterInput: ListsRouterInput {

    var output: ListsRouterOutput!

    var didCallShowEditListView: Bool = false
    var didCallShowTasks: Bool = false
    var listForShowEditListView: List?
    var listForShowTasks: List?

    func showEditListView(with list: List) {
        self.didCallShowEditListView = true
        self.listForShowEditListView = list
    }

    func showTasks(for list: List) {
        self.didCallShowTasks = true
        self.listForShowTasks = list
    }

    #if os(tvOS)
    func showConfirmDeleteAlert(title: String, confirmActionTitle: String, cancelActionTitle: String, confirmAction: @escaping () -> Void) {}
    #endif
}
