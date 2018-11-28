//
//  EditListInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyKit

class EditListInteractor: EditListInteractorInput {

    // MARK: - Properties

    var output: EditListInteractorOutput!
    let lists: Lists
    var list: List

    // MARK: - EditListInteractorInput

    required init(list: List, lists: Lists) {
        self.list = list
        self.lists = lists
    }

    func saveList(title: String) {
        list.title = title

        do {
            try lists.add(list)
            self.output.finish(with: list)
        } catch(let error) {
            self.output.failedToSaveList(with: error as NSError)
        }
    }
}
