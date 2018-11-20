//
//  ListsListRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class ListsRouter {

    weak var view: ListsViewController!

    init(view: ListsViewController) {
        self.view = view
    }

    // MARK: - Public interface

    func showEditListView(with list: List) {
        let storyboard = UIStoryboard(name: "EditList", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let controller = (navigationController.topViewController as! EditListViewController)
        controller.list = list
        controller.delegate = self

        self.view.present(navigationController, animated: true, completion: nil)
    }

    func showTasks(for list: List) {
        let controller = TasksListRouter.scene(list: list)

        self.view.navigationController!.pushViewController(controller, animated: true)
    }
}

extension ListsRouter: EditListViewControllerDelegate {

    func didCancelWithController(_ controller: EditListViewController) {
        self.view.dismiss(animated: true, completion: nil)
    }

    func controller(_ controller: EditListViewController, didSaveList list: List) {
        self.view.reloadData()
        self.view.dismiss(animated: true, completion: nil)
    }
}
