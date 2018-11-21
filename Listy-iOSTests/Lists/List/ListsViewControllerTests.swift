//
//  ListsViewControllerTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS

class ListsViewControllerTests: XCTestCase {

    var sut: ListsViewController!
    var fakePresenter: FakeListsPresenterInput!
    var navigationController: UINavigationController!
    var window: UIWindow!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        window = UIWindow()
        let storyboard = UIStoryboard(name: "Lists", bundle: nil)
        navigationController = (storyboard.instantiateInitialViewController() as! UINavigationController)
        sut = (navigationController.topViewController as! ListsViewController)

        fakePresenter = FakeListsPresenterInput(view: sut)
        sut.presenter = fakePresenter
        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        navigationController = nil
        window = nil
        fakePresenter = nil

        super.tearDown()
    }

    // MARK: - Tests

    func testOutlets() {
        XCTAssertNotNil(sut.addBarButtonItem)
        XCTAssertNotNil(sut.tableView)
    }

    // MARK: - viewDidLoad()

    func testViewDidLoad() {
        XCTAssertTrue(fakePresenter.didCallViewDidLoad)
    }

    // MARK: - reloadData()

    func testReloadData() {
        // when
        sut.reloadData()

        // then
        XCTAssertTrue(fakePresenter.didCallReloadData)
    }

    // MARK: - Button actions

    func testAddBarButtonItemTapped() {
        // when
        sut.addBarButtonItem.tap()

        // then
        XCTAssertTrue(fakePresenter.didCallAddList)
    }

    // MARK: - UITableViewDelegate

    // MARK: - tableView(_:didSelectRowAt:)

    func testTableViewDidSelectRowAtIndexPath() {
        // given
        let tableView = sut.tableView!
        let indexPath = IndexPath(row: 0, section: 0)

        // when
        sut.tableView(tableView, didSelectRowAt: indexPath)

        // then
        XCTAssertTrue(fakePresenter.didCallHandleActionForSelectedRow)
    }
}
