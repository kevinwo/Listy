//
//  EditListRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyKit

class EditListRouter {

    weak var view: EditListViewController!

    required init(view: EditListViewController) {
        self.view = view
    }

    // MARK: - Public interface

    static func scene(list: List, delegate: EditListViewControllerDelegate) -> UINavigationController {
        let storyboard = UIStoryboard(name: "EditList", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let controller = navigationController.topViewController as! EditListViewController
        controller.delegate = delegate

        return navigationController
    }
}
