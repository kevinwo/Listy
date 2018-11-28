//
//  TasksListPresenterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

import ListyKit

protocol TasksListPresenterInput {

    var output: TasksListPresenterOutput! { get set }
    var router: TasksListRouterInput! { get set }
    var interactor: TasksListInteractorInput! { get set }

    func reloadData()
    func addTask()
    func deleteTask(_ task: Task, at indexPath: IndexPath)
}
