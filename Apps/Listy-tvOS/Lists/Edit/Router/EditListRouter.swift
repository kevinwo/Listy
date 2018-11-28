//
//  EditListRouter.swift
//  Listy-tvOS
//
//  Created by Kevin Wolkober on 11/28/18.
//

import ListyUI
import ListyKit

class EditListRouter: EditListRouterInput {

    // MARK: - Properties

    weak var output: EditListRouterOutput!

    // MARK: - Public interface

    static func scene(list: List, delegate: EditListViewControllerDelegate, lists: Lists) -> UINavigationController {
        let storyboard = UIStoryboard(name: "EditList", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let controller = navigationController.topViewController as! EditListViewController
        controller.delegate = delegate

        let presenter = EditListPresenter()
        let router = EditListRouter()
        let interactor = EditListInteractor(list: list, lists: lists)

        controller.presenter = presenter

        presenter.output = controller
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.output = controller

        return navigationController
    }

    func finishWithCancel() {
        self.output.finishWithCancel()
    }

    func finishWithSaving(_ list: List) {
        self.output.finishWithSaving(list)
    }
}
