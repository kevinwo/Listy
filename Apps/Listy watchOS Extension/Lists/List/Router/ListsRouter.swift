//
//  ListsRouter.swift
//  Listy watchOS Extension
//
//  Created by Kevin Wolkober on 11/29/18.
//

import ListyKit

class ListsRouter: ListsRouterInput {

    var output: ListsRouterOutput!

    func showEditListView(with list: List) {
        let lists = Lists(database: Database.newInstance())
        self.output.presentController(withName: <#T##String#>, context: <#T##Any?#>)
    }

    func showTasks(for list: List) {}
}
