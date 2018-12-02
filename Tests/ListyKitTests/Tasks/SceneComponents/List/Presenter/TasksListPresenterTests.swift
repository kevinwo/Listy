//
//  TasksListPresenterTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
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

    // MARK: - deleteTask(_:at:)

    func testDeleteTask() {
        // given
        let task = Task()
        let indexPath = IndexPath(row: 0, section: 0)

        // when
        sut.deleteTask(task, at: indexPath)

        // then
        XCTAssertTrue(fakeInteractor.didCallDeleteTaskAtIndexPath)
        XCTAssertEqual(fakeInteractor.taskToDelete, task)
        XCTAssertEqual(fakeInteractor.deletedTaskAtIndexPath, indexPath)
    }
}

// MARK: - TasksListPresenterOutput

extension TasksListPresenterTests {

    // MARK: - updateView(tasks:list:)

    func testUpdateView() {
        // given
        let tasks = [Task()]
        let list = List()
        list.title = "Cool List"

        // when
        sut.updateView(tasks: tasks, list: list)

        // then
        XCTAssertTrue(fakeOutput.didCallUpdateView)
        XCTAssertEqual(fakeOutput.updateViewTasks, tasks)
        XCTAssertEqual(fakeOutput.updateViewTitle, list.title)
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
        sut.failedToDeleteTask(with: error)

        // then
        XCTAssertTrue(fakeOutput.didCallShowErrorAlert)
        XCTAssertEqual(fakeOutput.errorToShowInAlert, error)
    }
}
