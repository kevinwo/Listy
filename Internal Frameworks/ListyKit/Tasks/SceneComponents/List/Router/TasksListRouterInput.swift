//
//  TasksListRouterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

public protocol TasksListRouterInput: class {

    var output: TasksListRouterOutput! { get set }

    func showEditTaskView(with task: Task)
}
