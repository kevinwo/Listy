//
//  TasksListRouterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

import ListyKit

protocol TasksListRouterInput: class {

    var output: TasksListRouterOutput! { get set }

    static func scene(list: List) -> TasksListViewController
    func showEditTaskView(with task: Task)
}
