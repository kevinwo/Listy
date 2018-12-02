//
//  TasksListRouter.swift
//  Listy-tvOS
//
//  Created by Kevin Wolkober on 12/2/18.
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

    func showEditTaskView(with task: Task) {}
}
