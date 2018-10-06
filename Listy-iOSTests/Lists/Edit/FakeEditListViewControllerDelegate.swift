//
//  FakeEditListViewControllerDelegate.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeEditListViewControllerDelegate: NSObject, EditListViewControllerDelegate {

    var didCallCancelWithController: Bool = false
    var didCallControllerDidSaveList: Bool = false

    func didCancelWithController(_ controller: EditListViewController) {
        self.didCallCancelWithController = true
    }

    func controller(_ controller: EditListViewController, didSaveList list: List) {
        self.didCallControllerDidSaveList = true
    }
}
