//
//  EditListInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyKit

class EditListInteractor {

    var output: EditListPresenter!
    var lists: Lists
    var list: List?

    init(output: EditListPresenter) {
        self.output = output
        self.lists = Lists(database: Database.newInstance())
    }

    func loadData() {
        // Load some cool data
        self.output.updateView()
    }

    func saveList(title: String) {
        let list = self.list ?? List()
        list.title = title

        do {
            try lists.add(list)
            self.output.updateView()
        } catch(let error) {
            self.output.showErrorAlert(error)
        }
    }
}
