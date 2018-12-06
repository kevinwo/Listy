//
//  TasksListInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import ListyKit

class TasksListInteractorTests: XCTestCase {

    var sut: TasksListInteractor!
    var fakeOutput: FakeTasksListInteractorOutput!
    var tasks: Tasks!
    var list: List!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        FileManager().clearTemporaryDirectory()

        fakeOutput = FakeTasksListInteractorOutput()
        list = List()
        tasks = Tasks(database: Database.newInstance(path: NSTemporaryDirectory()))
        sut = TasksListInteractor(list: list)

        sut.output = fakeOutput
        sut.tasks = tasks
    }

    override func tearDown() {
        sut = nil
        fakeOutput = nil
        list = nil
        tasks = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(output:)

    func testInit() {
        // when
        let interactor = TasksListInteractor(list: list)

        // then
        XCTAssertEqual(interactor.list, list)
    }

    // MARK: - fetchData()

    func testFetchData() {
        // given
        let task = Task()
        task.title = "Important task"
        task.listId = list.id
        try! tasks.add(task)

        // when
        sut.fetchData()

        // then
        XCTAssertTrue(fakeOutput.didCallUpdateView)
        XCTAssert(fakeOutput.updateViewTasks?.contains(task) ?? false)
        XCTAssertEqual(fakeOutput.updateViewList, list)
    }

    // MARK: - newTask()

    func testNewTask() {
        // when
        let task = sut.newTask()

        // then
        XCTAssertNotNil(task)
        XCTAssertEqual(task.title, "")
    }
}
