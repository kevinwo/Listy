//
//  FakeEditTaskInteractor.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeEditTaskInteractor: EditTaskInteractor {

    var didCallLoadTask: Bool = false
    var didCallSaveTask: Bool = false
    var loadedTask: Task?

    override func loadTask(_ task: Task) {
        self.didCallLoadTask = true
        self.loadedTask = task
    }

    override func saveTask(title: String) {
        self.didCallSaveTask = true
    }
}
