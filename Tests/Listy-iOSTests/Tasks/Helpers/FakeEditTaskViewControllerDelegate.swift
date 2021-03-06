//
//  FakeEditTaskViewControllerDelegate.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import ListyUI
@testable import ListyKit

class FakeEditTaskViewControllerDelegate: EditTaskViewControllerDelegate {

    var didCallCancelWithController: Bool = false
    var didCallControllerDidSaveTask: Bool = false

    func didCancelWithController(_ controller: EditTaskViewController) {
        self.didCallCancelWithController = true
    }

    func controller(_ controller: EditTaskViewController, didSaveTask list: Task) {
        self.didCallControllerDidSaveTask = true
    }
}
