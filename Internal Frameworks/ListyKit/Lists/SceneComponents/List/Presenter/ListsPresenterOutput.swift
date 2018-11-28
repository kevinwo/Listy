//
//  ListsPresenterOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

public protocol ListsPresenterOutput: class, ErrorAlertable {

    func updateView(lists: [List])
    func deleteRow(at indexPath: IndexPath)
}
