//
//  FakeEditListRouterOutput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/28/18.
//

@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class FakeEditListRouterOutput: EditListRouterOutput {

    var didFinishWithCancel: Bool = false
    var didFinishWithSave: Bool = false
    var didCallPresentView: Bool = false
    var didCallDismissView: Bool = false
    var presentedView: ViewRoutable!
    var savedList: List!

    func finishWithCancel() {
        self.didFinishWithCancel = true
    }

    func finishWithSaving(_ list: List) {
        self.didFinishWithSave = true
        self.savedList = list
    }

    // MARK: - ViewRoutable

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {
        self.didCallPresentView = true
        self.presentedView = view
    }

    func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        self.didCallDismissView = true
    }
}
