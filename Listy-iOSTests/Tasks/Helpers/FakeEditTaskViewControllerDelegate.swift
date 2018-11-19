//
//  FakeEditTaskViewControllerDelegate.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import Listy_iOS
@testable import ListyKit

class FakeEditTaskViewControllerDelegate: NSObject, EditTaskViewControllerDelegate {

    var didCallCancelWithController: Bool = false
    var didCallControllerDidSaveTask: Bool = false

    func didCancelWithController(_ controller: EditTaskViewController) {
        self.didCallCancelWithController = true
    }

    func controller(_ controller: EditTaskViewController, didSaveTask list: Task) {
        self.didCallControllerDidSaveTask = true
    }
}
