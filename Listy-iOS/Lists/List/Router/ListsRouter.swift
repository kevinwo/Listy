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

    init(output: ListsRouterOutput) {
        self.output = output
    }

    // MARK: - Public interface

    func showEditListView(with list: List) {
        let storyboard = UIStoryboard(name: "EditList", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let controller = (navigationController.topViewController as! EditListViewController)
        controller.list = list
        controller.delegate = self

        self.output.present(view: navigationController, animated: true, completion: nil)
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
