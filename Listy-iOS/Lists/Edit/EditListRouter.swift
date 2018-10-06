//
//  EditListRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI

class EditListRouter: NSObject, Router {

    typealias T = EditListViewController

    static var storyboard: UIStoryboard {
        get {
            return UIStoryboard(name: "EditList", bundle: nil)
        }
    }
    weak var view: EditListViewController!

    required init(view: EditListViewController) {
        self.view = view
    }
}
