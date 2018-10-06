//
//  EditTaskRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI

class EditTaskRouter: NSObject, Router {

    typealias T = EditTaskViewController

    static var storyboard: UIStoryboard {
        get {
            return UIStoryboard(name: "EditTask", bundle: nil)
        }
    }
    weak var view: EditTaskViewController!

    required init(view: EditTaskViewController) {
        self.view = view
    }
}
