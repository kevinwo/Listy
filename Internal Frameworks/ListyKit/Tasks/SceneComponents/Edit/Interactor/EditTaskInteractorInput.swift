//
//  EditTaskInteractorInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/17/18.
//

public protocol EditTaskInteractorInput {

    var output: EditTaskInteractorOutput! { get set }

    init(task: Task, tasks: Tasks)
    func saveTask(title: String?)
}
