//
//  ListsRouter.swift
//  Listy macOS
//
//  Created by Kevin Wolkober on 12/1/18.
//

import Cocoa
import ListyKit

class ListsRouter: ListsRouterInput {

    // MARK: - ListsRouterInput

    weak var output: ListsRouterOutput!

    static func setScene(for controller: ListsViewController, lists: Lists, tasks: Tasks) {
        let presenter = ListsPresenter()
        let router = ListsRouter()
        let interactor = ListsInteractor(lists: lists, tasks: tasks)

        controller.presenter = presenter

        presenter.output = controller
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.output = controller
    }

    func showEditListView(with list: List) {}

    func showTasks(for list: List) {}
}
