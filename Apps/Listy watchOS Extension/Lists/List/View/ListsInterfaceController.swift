//
//  ListsInterfaceController.swift
//  Listy watchOS Extension
//
//  Created by Kevin Wolkober on 11/29/18.
//

import WatchKit
import Foundation
import ListyKit

class ListsInterfaceController: WKInterfaceController {

    @IBOutlet weak var addListButton: WKInterfaceButton!
    @IBOutlet weak var table: WKInterfaceTable!

    var presenter: ListsPresenterInput!
    var lists: [List]!

    override init() {
        super.init()

        let database = Database.newInstance()
        let lists = Lists(database: database)
        let tasks = Tasks(database: database)

        ListsRouter.setScene(for: self, lists: lists, tasks: tasks)
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

    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        if table == self.table {
            let list = self.lists[rowIndex]
            self.presenter.showTasks(for: list)
        }
    }

    // MARK: - Button actions

    @IBAction func addListButtonTapped() {
        self.presenter.addList()
    }
}

extension ListsInterfaceController: ListsPresenterOutput {

    public func updateView(lists: [List]) {
        self.lists = lists
        self.table.setNumberOfRows(lists.count, withRowType: "List")

        for (index, list) in lists.enumerated() {
            let row = self.table.rowController(at: index) as! ListRowController
            row.titleLabel.setText(list.title)
        }
    }

    public func deleteRow(at indexPath: IndexPath) {}
}

extension ListsInterfaceController: ListsRouterOutput {

    public func reloadData() {
        self.presenter.reloadData()
    }
}
