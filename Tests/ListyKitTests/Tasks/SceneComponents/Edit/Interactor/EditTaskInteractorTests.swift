//
//  EditTaskInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import ListyKit

class EditTaskInteractorTests: XCTestCase {

    var sut: EditTaskInteractor!
    var fakeOutput: FakeEditTaskInteractorOutput!
    var task: Task!
    var tasks: Tasks!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        fakeOutput = FakeEditTaskInteractorOutput()
        task = Task()
        tasks = Tasks(database: Database.newInstance(path: NSTemporaryDirectory()))

        sut = EditTaskInteractor(task: task, tasks: tasks)
        sut.output = fakeOutput
    }

    override func tearDown() {
        sut = nil
        fakeOutput = nil
        tasks = nil
        task = nil

        super.tearDown()
    }

    // MARK: - Tests

    func testInit() {
        XCTAssertEqual(sut.task, task)
        XCTAssertEqual(sut.tasks, tasks)
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
