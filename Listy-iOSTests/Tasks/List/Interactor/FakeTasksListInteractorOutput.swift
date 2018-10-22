//
//  FakeTasksListInteractorOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/22/18.
//

import UIKit
@testable import Listy_iOS

class FakeTasksListInteractorOutput: TasksListInteractorOutput {

    var didCallUpdateView: Bool = false
    var didCallDeleteRow: Bool = false

    func updateView() {
        self.didCallUpdateView = true
    }

    func deleteRow(at indexPath: IndexPath) {
        self.didCallDeleteRow = true
    }
}
