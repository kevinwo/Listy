//
//  FakeEditListInteractorOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/27/18.
//

import Foundation
@testable import Listy_iOS
@testable import ListyKit

class FakeEditListInteractorOutput: EditListInteractorOutput {

    var didCallShowErrorAlert: Bool = false
    var didCallFinish: Bool = false
    var didCallFailedToSaveList: Bool = false

    var finishList: List?
    var errorForFailedToSaveList: NSError?

    func showErrorAlert(_ error: Error) {
        self.didCallShowErrorAlert = true
    }

    func finish(with list: List) {
        self.didCallFinish = true
        self.finishList = list
    }

    func failedToSaveList(with error: NSError) {
        self.didCallFailedToSaveList = true
        self.errorForFailedToSaveList = error
    }
}
