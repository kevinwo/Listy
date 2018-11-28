//
//  ListsViewControllerTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

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

        fakePresenter = FakeListsPresenterInput()
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
        XCTAssertEqual(sut.navigationItem.rightBarButtonItem, sut.addBarButtonItem)
    }

    // MARK: - viewDidLoad()

    func testViewDidLoad() {
        XCTAssert(sut.tableView.dataSource is TableViewDataSource)
        XCTAssert(sut.tableView.delegate is ListsViewTableViewDelegate)
        XCTAssertTrue(fakePresenter.didCallReloadData)
    }

    // MARK: - Button actions

    func testAddBarButtonItemTapped() {
        // when
        sut.addBarButtonItem.tap()

        // then
        XCTAssertTrue(fakePresenter.didCallAddList)
    }

    // MARK: - ListsPresenterOutput

    // MARK: - updateView(lists:)

    func testUpdateView() {
        // given
        let list = List()
        list.title = "Cool List"
        let lists = [list]

        // when
        sut.updateView(lists: lists)

        // then
        XCTAssertEqual(sut.tableViewDataSource.sections.first, lists)
        XCTAssertNotNil(sut.tableViewDataSource.cellConfigurationBlock)
        XCTAssertNotNil(sut.tableViewDelegate.didSelectRowHandler)
        XCTAssertNotNil(sut.tableViewDelegate.deleteRowHandler)

        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell?.textLabel?.text, list.title)
    }

    // MARK: - deleteRow(at:)

    func testDeleteRowAtIndexPath() {
        // given
        let indexPath = IndexPath(row: 0, section: 0)
        let list = List()
        list.title = "Cool List"
        let lists = [list]
        sut.updateView(lists: lists)

        XCTAssert((sut.tableViewDataSource.sections[indexPath.section] as? [List])?.contains(list) ?? false)
        let beforeCell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(beforeCell?.textLabel?.text, list.title)

        // when
        sut.deleteRow(at: IndexPath(row: 0, section: 0))

        // then
        let section = sut.tableViewDataSource.sections[indexPath.section]
        XCTAssertFalse((section as? [List])?.contains(list) ?? false)
        let afterCell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertNil(afterCell)
    }

    // MARK: - ListRouterOutput

    // MARK: - reloadData()

    func testReloadData() {
        // when
        sut.reloadData()

        // then
        XCTAssertTrue(fakePresenter.didCallReloadData)
    }
}
