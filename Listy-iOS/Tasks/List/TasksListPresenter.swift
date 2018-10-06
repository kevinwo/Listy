//
//  TasksListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI

class TasksListPresenter: Presenter {

    weak var view: TasksListViewController!
    var router: TasksListRouter
    var interactor: TasksListInteractor!

    init(view: TasksListViewController) {
        self.view = view
        self.router = TasksListRouter(view: view)

        super.init()

        self.interactor = TasksListInteractor(output: self)
    }

    // MARK: - Public interface

    override func viewDidLoad() {
        // Load cool stuff, generally with the interactor
    }

    func updateView() {
        // Update the view
    }
}
