//
//  ListsPresenterTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class ListsPresenterTests: XCTestCase {

    var sut: ListsPresenter!
    var fakeOutput: FakeListsPresenterOutput!
    var fakeRouter: FakeListsRouterInput!
    var fakeInteractor: FakeListsInteractorInput!
    var lists: Lists!
    var tasks: Tasks!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let database = Database.newInstance(path: NSTemporaryDirectory())
        lists = Lists(database: database)
        tasks = Tasks(database: database)
        let presenter = ListsPresenter()

        fakeOutput = FakeListsPresenterOutput()
        fakeRouter = FakeListsRouterInput()
        fakeInteractor = FakeListsInteractorInput(lists: lists, tasks: tasks)

        presenter.output = fakeOutput
        presenter.interactor = fakeInteractor
        presenter.router = fakeRouter
        sut = presenter
    }

    override func tearDown() {
        sut = nil
        fakeInteractor = nil
        fakeRouter = nil
        fakeOutput = nil
        lists = nil
        tasks = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - loadData(into:)

    func testLoadData() {
        // given
        let tableView = UITableView()

        // when
        sut.loadData(into: tableView)

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
        XCTAssertTrue(fakeRouter.didCallShowEditListView)
        XCTAssertNotNil(fakeRouter.listForShowEditListView)
    }

    // MARK: handleActionForSelectedRow(at:)

    func testHandleActionForSelectedRow() {
        // given
        let indexPath = IndexPath(row: 0, section: 0)
        let list = fakeInteractor.testList

        // when
        sut.handleActionForSelectedRow(at: indexPath)

        // then
        XCTAssertTrue(fakeRouter.didCallShowTasks)
        XCTAssertEqual(fakeRouter.listForShowTasks, list)
    }
}
