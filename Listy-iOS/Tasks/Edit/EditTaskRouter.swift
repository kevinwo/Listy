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

    weak var view: EditTaskViewController!

    init(view: EditTaskViewController) {
        self.view = view
    }

    // MARK: - Public interface

    func finishWithCancel() {
        self.view.delegate.didCancelWithController(self.view)
    }

    func finishWithSaving(_ task: Task) {
        self.view.delegate.controller(self.view, didSaveTask: task)
    }
}
