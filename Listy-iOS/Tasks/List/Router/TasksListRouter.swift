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

    weak var output: TasksListRouterOutput!

    // MARK: - Public interface

    static func scene(list: List) -> TasksListViewController {
        let storyboard = UIStoryboard(name: "TasksList", bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! TasksListViewController
        let presenter = TasksListPresenter()
        let router = TasksListRouter()
        let interactor = TasksListInteractor(list: list)

        controller.presenter = presenter

        presenter.output = controller
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.output = controller

        return controller
    }

    func showEditTaskView(with task: Task) {
        let controller = EditTaskRouter.scene(task: task, delegate: self)
        self.output.present(view: controller, animated: true, completion: nil)
    }
}

extension TasksListRouter: EditTaskViewControllerDelegate {

    func didCancelWithController(_ controller: EditTaskViewController) {
        self.output.dismiss(animated: true, completion: nil)
    }
 
    func controller(_ controller: EditTaskViewController, didSaveTask task: Task) {
        self.output.reloadData()
        self.output.dismiss(animated: true, completion: nil)
    }
}
