//
//  EditTaskInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class EditTaskInteractorTests: XCTestCase {

    var sut: EditTaskInteractor!
    var fakeOutput: FakeEditTaskInteractorOutput!
    var tasks: Tasks!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        fakeOutput = FakeEditTaskInteractorOutput()
        sut = EditTaskInteractor(output: fakeOutput)

        tasks = Tasks(database: Database.newInstance(path: NSTemporaryDirectory()))
        sut.tasks = tasks
    }

    override func tearDown() {
        sut = nil
        fakeOutput = nil
        tasks = nil

        super.tearDown()
    }

    // MARK: - Tests

    func testInit() {
        // when
        let interactor = EditTaskInteractor(output: fakeOutput)

        // then
        XCTAssert(interactor.output === fakeOutput)
    }

    // MARK: - loadTask(_:)

    func testLoadTask() {
        // given
        let task = Task()

        // when
        sut.loadTask(task)

        // then
        XCTAssertEqual(sut.task, task)
    }

    // MARK: - saveList(title:)
    
    func testSaveTask_WhenSuccess() {
        // given
        let list = List()
        let newTask = Task()
        newTask.listId = list.id
        sut.task = newTask

        let title = "Important task"
        let allTasksBeforeSave = tasks.all()
        XCTAssertNil(allTasksBeforeSave.filter({ $0.title == title }).first)

        // when
        sut.saveTask(title: title)

        // then
        let allTasksAfterSave = tasks.all()
        XCTAssertNotNil(allTasksAfterSave.filter({ $0.title == title }).first)
        XCTAssertTrue(fakeOutput.didCallFinish)
    }
}
