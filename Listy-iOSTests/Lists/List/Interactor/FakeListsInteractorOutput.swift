//
//  FakeListsInteractorOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/21/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeListsInteractorOutput: ListsInteractorOutput {

    var didCallUpdateView: Bool = false
    var didCallDeleteRow: Bool = false
    var deletedRowIndexPath: IndexPath?
    var lists: [List]?

    func updateView(lists: [List]) {
        self.didCallUpdateView = true
        self.lists = lists
    }

    func deleteRow(at indexPath: IndexPath) {
        self.didCallDeleteRow = true
        self.deletedRowIndexPath = indexPath
    }
}
