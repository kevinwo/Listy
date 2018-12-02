//
//  FakeEditTaskInteractorInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeEditTaskInteractorInput: EditTaskInteractorInput {

    weak var output: EditTaskInteractorOutput!
    var didCallLoadTask: Bool = false
    var didCallSaveTask: Bool = false
    var task: Task
    let tasks: Tasks

    required init(task: Task, tasks: Tasks) {
        self.task = task
        self.tasks = tasks
    }

    func saveTask(title: String) {
        self.didCallSaveTask = true
    }
}
