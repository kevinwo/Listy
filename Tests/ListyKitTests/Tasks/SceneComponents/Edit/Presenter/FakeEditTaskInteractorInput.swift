//
//  FakeEditTaskInteractorInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import ListyKit

class FakeEditTaskInteractorInput: EditTaskInteractorInput {

    weak var output: EditTaskInteractorOutput!
    var task: Task
    let tasks: Tasks

    var didCallLoadTask: Bool = false
    var didCallSaveTask: Bool = false

    var saveListTask: String?

    required init(task: Task, tasks: Tasks) {
        self.task = task
        self.tasks = tasks
    }

    func saveTask(title: String?) {
        self.didCallSaveTask = true
        self.saveListTask = title
    }
}
