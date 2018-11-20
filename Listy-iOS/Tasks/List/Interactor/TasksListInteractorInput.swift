//
//  TasksListInteractorInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

import ListyUI
import ListyKit

protocol TasksListInteractorInput {

    var output: TasksListInteractorOutput! { get set }

    init(list: List)
    func loadDataSource(
        for tableView: UITableView,
        cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock)
    func fetchData()
    func newTask() -> Task
    func deleteTask(at indexPath: IndexPath)
}
