//
//  InterfaceController.swift
//  Listy watchOS Extension
//
//  Created by Kevin Wolkober on 11/29/18.
//

import WatchKit
import Foundation
import ListyKit

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var addListButton: WKInterfaceButton!
    @IBOutlet weak var table: WKInterfaceTable!
    var presenter: ListsPresenterInput!

    override init() {
        super.init()

        let database = Database.newInstance()
        let lists = Lists(database: database)
        let tasks = Tasks(database: database)

        let presenter = ListsPresenter()
        let router = ListsRouter()
        let interactor = ListsInteractor(lists: lists, tasks: tasks)

        self.presenter = presenter

        presenter.output = self
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.output = self
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        self.presenter.reloadData()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}

extension InterfaceController: ListsPresenterOutput {

    public func updateView(lists: [List]) {
        self.table.setNumberOfRows(lists.count, withRowType: "List")

        for (index, list) in lists.enumerated() {
            let row = table.rowController(at: index) as! ListRowController
            row.titleLabel.setText(list.title)
        }
    }

    public func deleteRow(at indexPath: IndexPath) {}
}

extension InterfaceController: ListsRouterOutput {

    public func reloadData() {
        self.presenter.reloadData()
    }
}
