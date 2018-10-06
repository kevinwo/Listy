//
//  ListsListRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class ListsListRouter: NSObject, Router {

    typealias T = ListsListViewController

    static var storyboard: UIStoryboard {
        get {
            return UIStoryboard(name: "ListsList", bundle: nil)
        }
    }
    weak var view: ListsListViewController!

    required init(view: ListsListViewController) {
        self.view = view
    }

    // MARK: - Public interface

    func showEditListView(with: List) {
    }
}
