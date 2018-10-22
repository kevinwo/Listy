//
//  TasksListViewable.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/21/18.
//

import ListyUI
import ListyKit

protocol TasksListViewable: ViewRoutable {

    var tableView: UITableView! { get set }
    var list: List! { get set }
    func reloadData()
}
