//
//  FakeEditListPresenterOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/27/18.
//

import Foundation
@testable import Listy_iOS

class FakeEditListPresenterOutput: EditListPresenterOutput {

    var didCallShowErrorAlert: Bool = false
    var errorToShowInAlert: NSError?

    func showErrorAlert(for error: NSError) {
        self.didCallShowErrorAlert = true
        self.errorToShowInAlert = error
    }
}
