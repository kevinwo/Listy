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

    #if os(tvOS)
    func showConfirmDeleteAlert(title: String, confirmActionTitle: String, cancelActionTitle: String, confirmAction: @escaping () -> Void)
    #endif
}
