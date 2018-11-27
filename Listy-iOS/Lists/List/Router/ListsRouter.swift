//
//  ListsRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
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

    func showEditListView(with list: List) {
        let controller = EditListRouter.scene(list: list, delegate: self)
        self.output.present(view: controller, animated: true, completion: nil)
    }

    func showTasks(for list: List) {
        let controller = TasksListRouter.scene(list: list)
        self.output.pushTasksListView(controller)
    }
}

extension ListsRouter: EditListViewControllerDelegate {

    func didCancelWithController(_ controller: EditListViewController) {
        self.output.dismiss(animated: true, completion: nil)
    }

    func controller(_ controller: EditListViewController, didSaveList list: List) {
        self.output.reloadData()
        self.output.dismiss(animated: true, completion: nil)
    }
}
