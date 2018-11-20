//
//  FakeTasksListPresenterOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/20/18.
//

import Foundation
@testable import Listy_iOS

class FakeTasksListPresenterOutput: TasksListPresenterOutput {

    var presenter: TasksListPresenterInput!

    var didCallUpdateView: Bool = false
    var didCallDeleteRow: Bool = false
    var updateViewTitle: String?
    var deletedRowIndexPath: IndexPath?

    func updateView(title: String) {
        self.didCallUpdateView = true
        self.updateViewTitle = title
    }
    
    func deleteRow(at indexPath: IndexPath) {
        self.didCallDeleteRow = true
    }
}
