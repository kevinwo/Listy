//
//  EditTaskInteractorOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/17/18.
//

public protocol EditTaskInteractorOutput: class {

    func finish(with task: Task)
    func failedToSaveTask(with error: NSError)
}
