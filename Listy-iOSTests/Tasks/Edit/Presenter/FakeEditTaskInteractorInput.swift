//
//  FakeEditTaskInteractorInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeEditTaskInteractorInput: EditTaskInteractorInput {

    var output: EditTaskInteractorOutput
    var didCallLoadTask: Bool = false
    var didCallSaveTask: Bool = false
    var loadedTask: Task?

    required init(output: EditTaskInteractorOutput) {
        self.output = output
    }

    func loadTask(_ task: Task) {
        self.didCallLoadTask = true
        self.loadedTask = task
    }

    func saveTask(title: String) {
        self.didCallSaveTask = true
    }
}
