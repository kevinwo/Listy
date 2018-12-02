//
//  ListsRouter.swift
//  Listy watchOS Extension
//
//  Created by Kevin Wolkober on 11/29/18.
//

import ListyKit

class ListsRouter: ListsRouterInput {

    var output: ListsRouterOutput!

    static func setScene(for controller: ListsInterfaceController, lists: Lists, tasks: Tasks) {
        let presenter = ListsPresenter()
        let router = ListsRouter()
        let interactor = ListsInteractor(lists: lists, tasks: tasks)

        controller.presenter = presenter

        presenter.output = controller
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.output = controller
    }

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
