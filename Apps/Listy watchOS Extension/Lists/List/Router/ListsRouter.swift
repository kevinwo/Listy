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
        let context = ["list": list, "delegate": self] as [String : Any]
        self.output.presentController(withName: "EditList", context: context)
    }

    func showTasks(for list: List) {}
}

extension ListsRouter: EditListInterfaceControllerDelegate {

    func didCancelWithController(_ controller: EditListInterfaceController) {
        self.output.dismiss()
    }

    func controller(_ controller: EditListInterfaceController, didSaveList list: List) {
        self.output.reloadData()
        self.output.dismiss()
    }
}
