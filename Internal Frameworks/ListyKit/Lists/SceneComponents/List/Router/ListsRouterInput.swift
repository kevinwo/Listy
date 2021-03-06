//
//  ListsRouterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/20/18.
//

public protocol ListsRouterInput: class {

    var output: ListsRouterOutput! { get set }

    func showEditListView(with list: List)
    func showTasks(for list: List)
    func showConfirmDeleteAlert(title: String, confirmActionTitle: String, cancelActionTitle: String, confirmAction: @escaping () -> Void)
}

extension ListsRouterInput {

    public func showConfirmDeleteAlert(title: String, confirmActionTitle: String, cancelActionTitle: String, confirmAction: @escaping () -> Void) {
        // Optional
    }
}
