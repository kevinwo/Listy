//
//  FakeEditTaskInteractorOutput.swift
//  ListyKitTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import Foundation
@testable import ListyKit

class FakeEditTaskInteractorOutput: EditTaskInteractorOutput {

    var didCallShowErrorAlert: Bool = false
    var didCallFinish: Bool = false

    func showErrorAlert(_ error: Error) {
        self.didCallShowErrorAlert = true
    }

    func finish(with task: Task) {
        self.didCallFinish = true
    }

    func failedToSaveTask(with error: NSError) {}
}
