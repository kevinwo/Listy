//
//  TasksTests.swift
//  ListyKitTests
//
//  Created by Kevin Wolkober on 10/5/18.
//

import XCTest
@testable import ListyKit

class TasksTests: XCTestCase {

    let databasePath = NSTemporaryDirectory()
    var database: Database!
    var sut: Tasks!

    override func setUp() {
        database = Database.newInstance(path: databasePath)
        sut = Tasks(database: database)
    }

    override func tearDown() {
        database = nil
        sut = nil
    }

    // MARK: - Tests

    // MARK: - init()

    func testInit() {
        XCTAssertEqual(sut.database.path, databasePath)
    }

    // MARK: - all()

    func testAll() {
        // given
        let task1 = Task()
        task1.title = "Important task"
        try! sut.add(task1)

        let task2 = Task()
        task2.title = "Even more important task"
        try! sut.add(task2)

        // when
        let tasks = sut.all()

        // then
        XCTAssertNotNil(tasks.filter({ $0 == task1 }).first)
        XCTAssertNotNil(tasks.filter({ $0 == task2 }).first)
    }

    // MARK: - fetch(_:)

    func testFetch_WhenTaskExists() {
        // given
        let task = Task()
        task.title = "Important task"
        try! sut.add(task)
        let id = task.id

        // when
        let fetchedTask = sut.fetch(by: id)

        // then
        XCTAssertEqual(fetchedTask, task)
    }

    func testFetch_WhenTaskDoesNotExist() {
        // given
        let id = "bad-id"

        // when
        let fetchedTask = sut.fetch(by: id)

        // then
        XCTAssertNil(fetchedTask)
    }

    // MARK: - add(_:)

    func testAdd_WhenSuccess() {
        // given
        let task = Task()
        task.title = "Important task"

        // when
        XCTAssertNoThrow(try sut.add(task))

        // then
        let id = task.id
        let fetchedTask = sut.fetch(by: id)
        XCTAssertEqual(fetchedTask, task)
    }

    func testAdd_WhenFails() {
        // given
        let badDatabase = Database(path: "/bad/path")
        let tasks = Tasks(database: badDatabase)

        let task = Task()
        task.title = "Important task"

        // when/then
        XCTAssertThrowsError(try tasks.add(task))
    }}
