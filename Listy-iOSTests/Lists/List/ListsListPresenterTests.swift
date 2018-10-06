//
//  ListsListPresenterTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS

class ListsListPresenterTests: XCTestCase {

    var sut: ListsListPresenter!
    var fakeRouter: FakeListsListRouter!
    var controller: ListsListViewController!
    var window: UIWindow!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        window = UIWindow()
        let storyboard = UIStoryboard(name: "ListsList", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "ListsListViewController") as! ListsListViewController)
        sut = ListsListPresenter(view: controller)

        fakeRouter = FakeListsListRouter(view: controller)
        sut.router = fakeRouter

        controller.presenter = sut
        _ = controller.view
    }

    override func tearDown() {
        sut = nil
        controller = nil
        window = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(view:)

    func testInitWithView() {
        XCTAssertNotNil(sut.view)
        XCTAssertNotNil(sut.interactor)
    }

    // MARK: - addList()

    func testAddList() {
        // when
        sut.addList()

        // then
        XCTAssertTrue(fakeRouter.didShowEditListView)
    }
}
