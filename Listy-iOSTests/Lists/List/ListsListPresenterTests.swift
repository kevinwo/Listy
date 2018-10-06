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
    var fakeInteractor: FakeListsListInteractor!
    var controller: ListsListViewController!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "ListsList", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "ListsListViewController") as! ListsListViewController)
        sut = ListsListPresenter(view: controller)

        fakeInteractor = FakeListsListInteractor(output: sut)
        sut.interactor = fakeInteractor

        fakeRouter = FakeListsListRouter(view: controller)
        sut.router = fakeRouter

        controller.presenter = sut
        _ = controller.view
    }

    override func tearDown() {
        sut = nil
        controller = nil
        fakeRouter = nil
        fakeInteractor = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(view:)

    func testInitWithView() {
        // when
        let presenter = ListsListPresenter(view: controller)

        // then
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
    }

    // MARK: - viewDidLoad()

    func testViewDidLoad() {
        // when
        sut.viewDidLoad()

        // then
        XCTAssertTrue(fakeInteractor.didCallLoadDataSource)
        XCTAssertTrue(fakeInteractor.didCallFetchData)
    }

    // MARK: - reloadData()

    func testReloadData() {
        // when
        sut.reloadData()

        // then
        XCTAssertTrue(fakeInteractor.didCallFetchData)
    }

    // MARK: - addList()

    func testAddList() {
        // when
        sut.addList()

        // then
        XCTAssertTrue(fakeRouter.didShowEditListView)
    }

    // MARK: handleActionForSelectedRow(at:)

    func testHandleActionForSelectedRow() {
        // given
        let indexPath = IndexPath(row: 0, section: 0)
        let list = fakeInteractor.testList

        // when
        sut.handleActionForSelectedRow(at: indexPath)

        // then
        XCTAssertTrue(fakeRouter.didShowTasks)
        XCTAssertEqual(fakeRouter.didShowTasksList, list)
    }
}
