//
//  ListsRouter.swift
//  Listy-tvOS
//
//  Created by Kevin Wolkober on 11/28/18.
//

import ListyUI
import ListyKit

class ListsRouter: ListsRouterInput {

    weak var output: ListsRouterOutput!

    // MARK: - Public interface

    static func scene(lists: Lists, tasks: Tasks) -> UINavigationController {
        let storyboard = UIStoryboard(name: "Lists", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let controller = navigationController.topViewController as! ListsViewController
        let presenter = ListsPresenter()
        let router = ListsRouter()
        let interactor = ListsInteractor(lists: lists, tasks: tasks)

        controller.presenter = presenter

        presenter.output = controller
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.output = controller

        return navigationController
    }

    func showEditListView(with list: List) {}

    func showTasks(for list: List) {}
}
