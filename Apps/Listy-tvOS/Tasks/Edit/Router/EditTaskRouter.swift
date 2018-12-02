//
//  EditTaskRouter.swift
//  Listy-tvOS
//
//  Created by Kevin Wolkober on 12/3/18.
//

import ListyUI
import ListyKit

class EditTaskRouter: EditTaskRouterInput {

    // MARK: - Properties

    weak var view: EditTaskRouterOutput!

    // MARK: - Public interface

    static func scene(task: Task, delegate: EditTaskViewControllerDelegate, tasks: Tasks) -> UINavigationController {
        let storyboard = UIStoryboard(name: "EditTask", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let controller = navigationController.topViewController as! EditTaskViewController
        controller.delegate = delegate

        let presenter = EditTaskPresenter()
        let router = EditTaskRouter()
        let interactor = EditTaskInteractor(task: task, tasks: tasks)

        controller.presenter = presenter

        presenter.output = controller
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.view = controller

        return navigationController
    }

    func finishWithCancel() {
        self.view.finishWithCancel()
    }

    func finishWithSaving(_ task: Task) {
        self.view.finishWithSaving(task)
    }
}
