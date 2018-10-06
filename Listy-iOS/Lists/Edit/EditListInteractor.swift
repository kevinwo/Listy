//
//  EditListInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit

class EditListInteractor {

    var output: EditListPresenter!

    init(output: EditListPresenter) {
        self.output = output
    }

    func loadData() {
        // Load some cool data
        self.output.updateView()
    }

    func saveList(title: String) {
    }
}
