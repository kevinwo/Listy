//
//  EditListRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI

class EditListRouter {

    weak var view: EditListViewController!

    required init(view: EditListViewController) {
        self.view = view
    }
}
