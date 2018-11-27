//
//  EditTaskInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyKit

final class EditTaskInteractor: EditTaskInteractorInput {

    // MARK: - Properties

    weak var output: EditTaskInteractorOutput!
    let tasks: Tasks
    var task: Task

    required init(task: Task, tasks: Tasks) {
        self.task = task
        self.tasks = tasks
    }

    func saveTask(title: String) {
        task.title = title

        do {
            try tasks.add(task)
            self.output.finish(with: task)
        } catch(let error) {
            self.output.failedToSaveTask(with: error as NSError)
        }
    }
}
