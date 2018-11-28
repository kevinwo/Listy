//
//  AppRouterTests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/21/18.
//

import XCTest
@testable import Listy_iOS
@testable import ListyUI

class AppRouterTests: XCTestCase {

    var sut: AppRouter!

    override func setUp() {
        sut = AppRouter()
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Tests

    // MARK - configureInitialRoute(for:)

    func testConfigureInitialRoute() {
        // given
        let appDelegate = AppDelegate()

        // when
        sut.configureInitialRoute(for: appDelegate)

        // then
        XCTAssertNotNil(appDelegate.window)
        XCTAssertNotNil(appDelegate.window?.rootViewController)
        XCTAssert(appDelegate.window?.rootViewController is UINavigationController)

        let navigationController = appDelegate.window?.rootViewController as? UINavigationController
        XCTAssert(navigationController?.topViewController is ListsViewController)
    }
}
