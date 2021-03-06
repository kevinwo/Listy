//
//  ListsPresenterTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
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

    // MARK: - showTasks(for:)

    func testShowTasksForList() {
        // given
        let list = fakeInteractor.testList

        // when
        sut.showTasks(for: list)

        // then
        XCTAssertTrue(fakeRouter.didCallShowTasks)
        XCTAssertEqual(fakeRouter.listForShowTasks, list)
    }

    // MARK: - confirmDeleteList(_:confirmAction:)

    func testConfirmDeleteList() {
        // given
        let list = List()
        list.title = "Cool List"

        let action = { () -> Void in
        }

        // when
        sut.confirmDeleteList(list, confirmAction: action)

        // then
        XCTAssertTrue(fakeRouter.didCallShowConfirmDeleteAlert)
        XCTAssertNotNil(fakeRouter.confirmDeleteAlertTitle)
        XCTAssertNotNil(fakeRouter.confirmDeleteAlertConfirmActionTitle)
        XCTAssertNotNil(fakeRouter.confirmDeleteAlertCancelActionTitle)
        XCTAssertNotNil(fakeRouter.confirmDeleteAlertConfirmAction)
    }

    // MARK: - deleteList(_:at:)

    func testDeleteListAtIndexPath() {
        // given
        let list = fakeInteractor.testList
        let indexPath = IndexPath(row: 0, section: 0)

        // when
        sut.deleteList(list, at: indexPath)

        // then
        XCTAssertTrue(fakeInteractor.didCallDeleteList)
        XCTAssertEqual(fakeInteractor.deletedList, list)
        XCTAssertEqual(fakeInteractor.deletedListIndexPath, indexPath)
    }
}

// MARK: - ListsInteractorOutput

extension ListsPresenterTests {

    // MARK: - updateView(lists:)

    func testUpdateView() {
        // given
        let lists = [List()]

        // when
        sut.updateView(lists: lists)

        // then
        XCTAssertTrue(fakeOutput.didCallUpdateView)
        XCTAssertEqual(fakeOutput.listsFromUpdateView, lists)
    }

    // MARK: - deleteRow(at:)

    func testDeleteRow() {
        // given
        let indexPath = IndexPath(row: 0, section: 0)

        // when
        sut.deleteRow(at: indexPath)

        // then
        XCTAssertTrue(fakeOutput.didCallDeleteRow)
        XCTAssertEqual(fakeOutput.deletedRowIndexPath, indexPath)
    }

    // MARK: - failedToDeleteList(with:)

    func testFailedToDeleteList() {
        // given
        let error = NSError()

        // when
        sut.failedToDeleteList(with: error)

        // then
        XCTAssertTrue(fakeOutput.didCallShowErrorAlert)
        XCTAssertEqual(fakeOutput.errorToShowInAlert, error)
    }
}
