//
//  EditListRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyKit

class EditListRouter: EditListRouterInput {

    weak var view: EditListViewController!

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

        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.view = controller

        return navigationController
    }

    func finishWithCancel() {
        self.view.delegate.didCancelWithController(self.view)
    }

    func finishWithSaving(_ list: List) {
        self.view.delegate.controller(self.view, didSaveList: list)
    }
}
