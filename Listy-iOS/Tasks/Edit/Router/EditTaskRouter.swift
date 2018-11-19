//
//  EditTaskRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

struct EditTaskRouter: EditTaskRouterInput {

    weak var view: EditTaskRouterOutput!

    init(view: EditTaskRouterOutput) {
        self.view = view
    }

    // MARK: - Public interface

    static func scene(task: Task, delegate: EditTaskViewControllerDelegate) -> UINavigationController {
        let storyboard = UIStoryboard(name: "EditTask", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let controller = navigationController.topViewController as! EditTaskViewController
        controller.task = task
        controller.delegate = delegate

        return navigationController
    }

    func finishWithCancel() {
        self.view.finishWithCancel()
    }

    func finishWithSaving(_ task: Task) {
        self.view.finishWithSaving(task)
    }
}
