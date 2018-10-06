//
//  EditTaskInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyKit

class EditTaskInteractor {

    var output: EditTaskPresenter!
    var tasks: Tasks
    var task: Task?

    init(output: EditTaskPresenter) {
        self.output = output
        self.tasks = Tasks(database: Database.newInstance())
    }

    func saveTask(title: String) {
        let task = self.task ?? Task()
        task.title = title

        do {
            try tasks.add(task)
            self.output.finish(with: task)
        } catch(let error) {
            self.output.showErrorAlert(error)
        }
    }
}
