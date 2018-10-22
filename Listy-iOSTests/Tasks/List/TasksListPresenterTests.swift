//
//  TasksListPresenterTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class TasksListPresenterTests: XCTestCase {

    var sut: TasksListPresenter!
    var fakeRouter: FakeTasksListRouter!
    var fakeInteractor: FakeTasksListInteractor!
    var fakeView: FakeTasksListView!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        fakeView = FakeTasksListView()
        fakeView.list = List()
        sut = TasksListPresenter(view: fakeView)

        fakeInteractor = FakeTasksListInteractor(output: sut)
        sut.interactor = fakeInteractor

        fakeRouter = FakeTasksListRouter(view: fakeView)
        sut.router = fakeRouter
    }

    override func tearDown() {
        sut = nil
        fakeRouter = nil
        fakeInteractor = nil
        fakeView = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(view:)

    func testInitWithView() {
        // when
        let presenter = TasksListPresenter(view: fakeView)

        // then
        XCTAssert(presenter.view === fakeView)
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

    // MARK: - addTask()

    func testAddTask() {
        // given
        fakeInteractor.list = List()

        // when
        sut.addTask()

        // then
        XCTAssertTrue(fakeRouter.didShowEditTaskView)
    }
}
