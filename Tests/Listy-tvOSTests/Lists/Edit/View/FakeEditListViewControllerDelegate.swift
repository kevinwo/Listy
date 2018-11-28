//
//  FakeEditListViewControllerDelegate.swift
//  Listy-tvOSTests
//
//  Created by Kevin Wolkober on 11/28/18.
//

@testable import ListyUI
@testable import ListyKit

class FakeEditListViewControllerDelegate: NSObject, EditListViewControllerDelegate {

    var didCallCancelWithController: Bool = false
    var didCallControllerDidSaveList: Bool = false

    var didSaveListController: EditListViewController?
    var savedList: List?

    func didCancelWithController(_ controller: EditListViewController) {
        self.didCallCancelWithController = true
    }

    func controller(_ controller: EditListViewController, didSaveList list: List) {
        self.didCallControllerDidSaveList = true
        self.didSaveListController = controller
        self.savedList = list
    }
}
