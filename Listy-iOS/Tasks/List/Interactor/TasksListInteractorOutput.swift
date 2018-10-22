//
//  TasksListInteractorOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

import ListyUI

protocol TasksListInteractorOutput: ErrorAlertable {

    func updateView()
    func deleteRow(at indexPath: IndexPath)
}
