//
//  TasksListRouterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

import ListyKit

protocol TasksListRouterInput: class {

    var view: TasksListViewable! { get }

    func showEditTaskView(with task: Task)
}
