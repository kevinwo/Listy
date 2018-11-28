//
//  FakeEditListRouterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/27/18.
//

import Foundation
@testable import Listy_iOS
@testable import ListyKit

class FakeEditListRouterInput: EditListRouterInput {

    var didCallFinishWithCancel: Bool = false
    var didCallFinishWithSaving: Bool = false
    var listDidFinishWithSaving: List?

    func finishWithCancel() {
        self.didCallFinishWithCancel = true
    }

    func finishWithSaving(_ list: List) {
        self.didCallFinishWithSaving = true
        self.listDidFinishWithSaving = list
    }
}
