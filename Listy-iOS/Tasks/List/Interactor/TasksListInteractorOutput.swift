//
//  TasksListInteractorOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

import ListyUI
import ListyKit

protocol TasksListInteractorOutput {

    func updateView(tasks: [Task], list: List)
    func deleteRow(at indexPath: IndexPath)
    func failedToDeleteTask(with error: NSError)
}
