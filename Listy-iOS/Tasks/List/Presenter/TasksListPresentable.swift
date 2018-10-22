//
//  TasksListPresentable.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

import ListyUI

protocol TasksListPresentable {

    var view: TasksListViewable! { get }
    var router: TasksListRouterInput { get }
    var interactor: TasksListInteractorInput { get }

    func viewDidLoad()
    func reloadData()
    func addTask()
    func deleteTask(at indexPath: IndexPath)
}
