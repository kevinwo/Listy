//
//  FakeTasksListPresenter.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS

class FakeTasksListPresenter: TasksListPresentable {

    var view: TasksListViewable!
    var router: TasksListRouterInput
    lazy var interactor: TasksListInteractorInput = {
        return TasksListInteractor(output: self as! TasksListInteractorOutput)
    }()

    var didCallViewDidLoad: Bool = false
    var didCallReloadData: Bool = false
    var didCallAddTask: Bool = false
    var didCallDeleteTask: Bool = false

    required init(view: TasksListViewable) {
        self.view = view
        self.router = TasksListRouter(view: view as! TasksListViewController)
    }

    func viewDidLoad() {
        self.didCallViewDidLoad = true
    }

    func reloadData() {
        self.didCallReloadData = true
    }

    func addTask() {
        self.didCallAddTask = true
    }

    func deleteTask(at indexPath: IndexPath) {
        self.didCallDeleteTask = true
    }
}
