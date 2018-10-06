//
//  EditTaskInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit

class EditTaskInteractor {

    var output: EditTaskPresenter!

    init(output: EditTaskPresenter) {
        self.output = output
    }

    func loadData() {
        // Load some cool data
        self.output.updateView()
    }
}
