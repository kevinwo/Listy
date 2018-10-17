//
//  EditTaskInteractorInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/17/18.
//

import ListyKit

protocol EditTaskInteractorInput {

    var output: EditTaskInteractorOutput { get set }

    init(output: EditTaskInteractorOutput)
    func loadTask(_ task: Task)
    func saveTask(title: String)
}
