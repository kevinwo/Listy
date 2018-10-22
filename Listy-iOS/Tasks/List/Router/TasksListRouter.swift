//
//  TasksListRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class TasksListRouter: TasksListRouterInput {

    weak var view: TasksListViewable!

    init(view: TasksListViewable) {
        self.view = view
    }

    // MARK: - Public interface

    func showEditTaskView(with task: Task) {
        let storyboard = UIStoryboard(name: "EditTask", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let controller = (navigationController.topViewController as! EditTaskViewController)
        controller.task = task
        controller.delegate = self

        self.view.present(view: navigationController, animated: true, completion: nil)
    }
}

extension TasksListRouter: EditTaskViewControllerDelegate {

    func didCancelWithController(_ controller: EditTaskViewController) {
        self.view.dismiss(animated: true, completion: nil)
    }
 
    func controller(_ controller: EditTaskViewController, didSaveTask task: Task) {
        self.view.reloadData()
        self.view.dismiss(animated: true, completion: nil)
    }
}
