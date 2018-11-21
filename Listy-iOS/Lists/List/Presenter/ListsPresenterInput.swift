//
//  ListsPresenterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

import Foundation

protocol ListsPresenterInput: class {

    init(view: ListsViewController)
    func viewDidLoad()
    func reloadData()
    func addList()
    func handleActionForSelectedRow(at indexPath: IndexPath)
    func deleteList(at indexPath: IndexPath)
}
