//
//  EditTaskInteractor.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

public final class EditTaskInteractor: EditTaskInteractorInput {

    // MARK: - Properties

    public weak var output: EditTaskInteractorOutput!
    internal let tasks: Tasks
    internal var task: Task

    // MARK: - Object life cycle

    public required init(task: Task, tasks: Tasks) {
        self.task = task
        self.tasks = tasks
    }

    // MARK: - EditTaskInteractorInput
    
    public func saveTask(title: String) {
        task.title = title

        do {
            try tasks.add(task)
            self.output.finish(with: task)
        } catch(let error) {
            self.output.failedToSaveTask(with: error as NSError)
        }
    }
}
