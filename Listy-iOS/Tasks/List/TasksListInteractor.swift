//
//  TasksListInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit

class TasksListInteractor {

    var output: TasksListPresenter!

    init(output: TasksListPresenter) {
        self.output = output
    }

    func loadData() {
        // Load some cool data
        self.output.updateView()
    }
}
