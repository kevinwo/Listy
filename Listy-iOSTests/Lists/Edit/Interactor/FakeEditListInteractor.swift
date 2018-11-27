//
//  FakeEditListInteractor.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeEditListInteractor: EditListInteractor {

    var didCallSaveList: Bool = false

    override func saveList(title: String) {
        self.didCallSaveList = true
    }
}
