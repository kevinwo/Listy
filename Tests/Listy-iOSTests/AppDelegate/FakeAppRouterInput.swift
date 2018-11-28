//
//  FakeAppRouterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/21/18.
//

import UIKit
@testable import Listy_iOS

class FakeAppRouterInput: AppRouterInput {

    var didCallConfigureInitialRoute: Bool = false
    var appDelegateForConfigureInitialRoute: AppDelegate?

    func configureInitialRoute(for appDelegate: AppDelegate) {
        self.didCallConfigureInitialRoute = true
        self.appDelegateForConfigureInitialRoute = appDelegate
    }
}
