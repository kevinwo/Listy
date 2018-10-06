//
//  TasksListRouter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI

class TasksListRouter: NSObject, Router {

    typealias T = TasksListViewController

    static var storyboard: UIStoryboard {
        get {
            return UIStoryboard(name: "TasksList", bundle: nil)
        }
    }
    weak var view: TasksListViewController!

    required init(view: TasksListViewController) {
        self.view = view
    }
}
