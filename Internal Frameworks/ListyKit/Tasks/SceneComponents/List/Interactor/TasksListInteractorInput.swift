//
//  TasksListInteractorInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

public protocol TasksListInteractorInput {

    var output: TasksListInteractorOutput! { get set }

    init(list: List)
    func fetchData()
    func newTask() -> Task
    func deleteTask(_ task: Task, at indexPath: IndexPath)
}
