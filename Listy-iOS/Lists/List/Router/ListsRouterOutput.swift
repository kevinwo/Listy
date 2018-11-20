//
//  ListsRouterOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/20/18.
//

import ListyUI

protocol ListsRouterOutput: ViewRoutable {

    func pushTasksListView(_ controller: TasksListViewController)
    func reloadData()
}
