//
//  EditTaskInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyKit

class EditTaskInteractor: EditTaskInteractorInput {

    // MARK: - Properties

    var output: EditTaskInteractorOutput
    var tasks: Tasks
    var task: Task!

    required init(output: EditTaskInteractorOutput) {
        self.output = output
        self.tasks = Tasks(database: Database.newInstance())
    }

    func loadTask(_ task: Task) {
        self.task = task
    }

    func saveTask(title: String) {
        let task = self.task!
        task.title = title

        do {
            try tasks.add(task)
            self.output.finish(with: task)
        } catch(let error) {
            self.output.showErrorAlert(for: error)
        }
    }
}
