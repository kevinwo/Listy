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
    var didCallShowConfirmDeleteAlert: Bool = false

    var listForShowEditListView: List?
    var listForShowTasks: List?
    var confirmDeleteAlertTitle: String?
    var confirmDeleteAlertConfirmActionTitle: String?
    var confirmDeleteAlertCancelActionTitle: String?
    var confirmDeleteAlertConfirmAction: (() -> Void)?

    func showEditListView(with list: List) {
        self.didCallShowEditListView = true
        self.listForShowEditListView = list
    }

    func showTasks(for list: List) {
        self.didCallShowTasks = true
        self.listForShowTasks = list
    }

    func showConfirmDeleteAlert(title: String, confirmActionTitle: String, cancelActionTitle: String, confirmAction: @escaping () -> Void) {
        self.didCallShowConfirmDeleteAlert = true
        self.confirmDeleteAlertTitle = title
        self.confirmDeleteAlertConfirmActionTitle = confirmActionTitle
        self.confirmDeleteAlertCancelActionTitle = cancelActionTitle
        self.confirmDeleteAlertConfirmAction = confirmAction
    }
}
