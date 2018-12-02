//
//  TasksListPresenterOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/21/18.
//

public protocol TasksListPresenterOutput: class, ErrorAlertable {

    var presenter: TasksListPresenterInput! { get set }

    func updateView(title: String, tasks: [Task])
    func deleteRow(at indexPath: IndexPath)
}
