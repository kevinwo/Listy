//
//  ListsRouterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/20/18.
//

import ListyKit

protocol ListsRouterInput: class {

    var output: ListsRouterOutput! { get set }

    func showEditListView(with list: List)
    func showTasks(for list: List)
}
