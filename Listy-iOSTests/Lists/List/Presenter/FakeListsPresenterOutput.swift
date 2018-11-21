//
//  FakeListsPresenterOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/21/18.
//

import UIKit
@testable import Listy_iOS

class FakeListsPresenterOutput: ListsPresenterOutput {

    var didCallUpdateView: Bool = false
    var didCallDeleteRow: Bool = false
    var deletedRowIndexPath: IndexPath?

    func updateView() {
        self.didCallUpdateView = true
    }

    func deleteRow(at indexPath: IndexPath) {
        self.didCallDeleteRow = true
        self.deletedRowIndexPath = indexPath
    }
}
