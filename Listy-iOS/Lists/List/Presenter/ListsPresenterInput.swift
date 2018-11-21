//
//  ListsPresenterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

import UIKit

protocol ListsPresenterInput: class {

    func loadData(into tableView: UITableView)
    func reloadData()
    func addList()
    func handleActionForSelectedRow(at indexPath: IndexPath)
    func deleteList(at indexPath: IndexPath)
}
