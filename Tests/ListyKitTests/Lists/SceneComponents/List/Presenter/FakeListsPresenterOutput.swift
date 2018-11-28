//
//  FakeListsPresenterOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/21/18.
//

import UIKit
@testable import ListyKit

class FakeListsPresenterOutput: ListsPresenterOutput {

    var didCallUpdateView: Bool = false
    var didCallDeleteRow: Bool = false
    var didCallShowErrorAlert: Bool = false

    var deletedRowIndexPath: IndexPath?
    var listsFromUpdateView: [List]?
    var errorToShowInAlert: NSError?

    func updateView(lists: [List]) {
        self.didCallUpdateView = true
        self.listsFromUpdateView = lists
    }

    func deleteRow(at indexPath: IndexPath) {
        self.didCallDeleteRow = true
        self.deletedRowIndexPath = indexPath
    }

    func showErrorAlert(for error: NSError) {
        self.didCallShowErrorAlert = true
        self.errorToShowInAlert = error
    }
}
