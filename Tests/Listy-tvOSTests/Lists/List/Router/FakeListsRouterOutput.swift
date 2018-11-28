//
//  FakeListsRouterOutput.swift
//  Listy-tvOS
//
//  Created by Kevin Wolkober on 11/28/18.
//

import Foundation
@testable import Listy_tvOS
@testable import ListyKit

class FakeListsRouterOutput: ListsRouterOutput {

    var didCallReloadData: Bool = false
    var didCallPresentView: Bool = false
    var didCallPushView: Bool = false
    var didCallDismissView: Bool = false

    var presentedView: ViewRoutable?
    var pushedView: ViewRoutable?

    func reloadData() {
        self.didCallReloadData = true
    }

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {
        self.didCallPresentView = true
        self.presentedView = view
    }

    func push(view: ViewRoutable, animated flag: Bool) {
        self.didCallPushView = true
        self.pushedView = view
    }

    func dismiss(animated flag: Bool, completion: (() -> Void)?) {
        self.didCallDismissView = true
    }
}
