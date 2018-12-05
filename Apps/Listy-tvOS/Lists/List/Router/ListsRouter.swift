//
//  ListsRouter.swift
//  Listy-tvOS
//
//  Created by Kevin Wolkober on 11/28/18.
//

import ListyUI
import ListyKit

class ListsRouter: ListsRouterInput {

    weak var output: ListsRouterOutput!

    // MARK: - Public interface

    static func scene(lists: Lists, tasks: Tasks) -> UINavigationController {
        let storyboard = UIStoryboard(name: "Lists", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let controller = navigationController.topViewController as! ListsViewController
        let presenter = ListsPresenter()
        let router = ListsRouter()
        let interactor = ListsInteractor(lists: lists, tasks: tasks)

        controller.presenter = presenter

        presenter.output = controller
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.output = controller

        return navigationController
    }

    func showEditListView(with list: List) {
        let lists = Lists(database: Database.newInstance())
        let controller = EditListRouter.scene(list: list, delegate: self, lists: lists)
        self.output.present(view: controller, animated: true, completion: nil)
    }

    func showTasks(for list: List) {
        let controller = TasksListRouter.scene(list: list)
        self.output.push(view: controller, animated: true)
    }

    func showConfirmDeleteAlert(title: String, confirmActionTitle: String, cancelActionTitle: String, confirmAction: @escaping () -> Void) {
        let controller = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: confirmActionTitle, style: .destructive) { (_) in
            confirmAction()
        }
        let cancelAction = UIAlertAction(title: cancelActionTitle, style: .cancel, handler: nil)

        controller.addAction(confirmAction)
        controller.addAction(cancelAction)

        self.output.present(view: controller, animated: true, completion: nil)
    }
}

extension ListsRouter: EditListViewControllerDelegate {

    func didCancelWithController(_ controller: EditListViewController) {
        self.output.dismiss(animated: true, completion: nil)
    }

    func controller(_ controller: EditListViewController, didSaveList list: List) {
        self.output.reloadData()
        self.output.dismiss(animated: true, completion: nil)
    }
}
