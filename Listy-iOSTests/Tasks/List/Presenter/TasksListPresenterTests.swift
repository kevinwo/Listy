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
    var fakeRouter: FakeTasksListRouterInput!
    var fakeInteractor: FakeTasksListInteractorInput!
    var fakeOutput: FakeTasksListPresenterOutput!
    var list: List!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        list = List()
        let presenter = TasksListPresenter()

        fakeOutput = FakeTasksListPresenterOutput()
        fakeRouter = FakeTasksListRouterInput()
        fakeInteractor = FakeTasksListInteractorInput(list: list)

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
        list = nil

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

    // MARK: - addTask()

    func testAddTask() {
        // given
        fakeInteractor.list = List()
        XCTAssertNil(fakeRouter.taskForShowEditTaskView)

        // when
        sut.addTask()

        // then
        XCTAssertTrue(fakeRouter.didShowEditTaskView)
        XCTAssertNotNil(fakeRouter.taskForShowEditTaskView)
    }
}
