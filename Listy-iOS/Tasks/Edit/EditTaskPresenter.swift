//
//  EditTaskPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI

class EditTaskPresenter: Presenter {

    weak var view: EditTaskViewController!
    var router: EditTaskRouter
    var interactor: EditTaskInteractor!

    init(view: EditTaskViewController) {
        self.view = view
        self.router = EditTaskRouter(view: view)

        super.init()

        self.interactor = EditTaskInteractor(output: self)
    }

    // MARK: - Public interface

    override func viewDidLoad() {
        // Load cool stuff, generally with the interactor
    }

    func updateView() {
        // Update the view
    }
}
