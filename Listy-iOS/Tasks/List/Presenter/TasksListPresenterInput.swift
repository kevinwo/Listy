//
//  TasksListPresenterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

import ListyUI
import ListyKit

protocol TasksListPresenterInput {

    var output: TasksListPresenterOutput! { get set }
    var router: TasksListRouterInput! { get set }
    var interactor: TasksListInteractorInput! { get set }

    init()
    func loadData(into tableView: UITableView)
    func reloadData()
    func addTask()
    func deleteTask(at indexPath: IndexPath)
}
