//
//  AppDelegateTests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/21/18.
//

import XCTest
@testable import Listy_iOS

class AppDelegateTests: XCTestCase {

    var sut: AppDelegate!
    var fakeRouter: FakeAppRouterInput!

    override func setUp() {
        fakeRouter = FakeAppRouterInput()
        sut = AppDelegate()
        sut.router = fakeRouter
    }

    override func tearDown() {
        sut = nil
        fakeRouter = nil
    }

    // MARK: - Tests

    // MARK: - application(_:didFinishLaunchingWithOptions:)

    func testApplicationDidFinishLaunchingWithOptions() {
        // given
        let application = UIApplication.shared

        // when
        let result = sut.application(application, didFinishLaunchingWithOptions: [:])

        // then
        XCTAssertNotNil(sut.router)
        XCTAssertTrue(fakeRouter.didCallConfigureInitialRoute)
        XCTAssertEqual(fakeRouter.appDelegateForConfigureInitialRoute, sut)
        XCTAssertTrue(result)
    }
}
