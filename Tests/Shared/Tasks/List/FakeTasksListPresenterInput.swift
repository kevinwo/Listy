//
//  FakeTasksListPresenterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

@testable import ListyKit

final class FakeTasksListPresenterInput: TasksListPresenterInput {

    weak var output: TasksListPresenterOutput!
    var router: TasksListRouterInput!
    var interactor: TasksListInteractorInput!

    var didCallReloadData: Bool = false
    var didCallAddTask: Bool = false
    var didCallDeleteTask: Bool = false

    var deletedTask: Task?
    var deletedTaskAtIndexPath: IndexPath?

    required init() {}

    func reloadData() {
        self.didCallReloadData = true
    }

    func addTask() {
        self.didCallAddTask = true
    }

    func deleteTask(_ task: Task, at indexPath: IndexPath) {
        self.didCallDeleteTask = true
        self.deletedTask = task
        self.deletedTaskAtIndexPath = indexPath
    }
}
