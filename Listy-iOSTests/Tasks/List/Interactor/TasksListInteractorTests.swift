//
//  TasksListInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class TasksListInteractorTests: XCTestCase {

    var sut: TasksListInteractor!
    var fakeOutput: FakeTasksListInteractorOutput!
    var cellConfigurationBlock: TableViewDataSource.CellConfigurationBlock!
    var tasks: Tasks!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        FileManager().clearTemporaryDirectory()

        fakeOutput = FakeTasksListInteractorOutput()
        sut = TasksListInteractor(output: fakeOutput)

        tasks = Tasks(database: Database.newInstance(path: NSTemporaryDirectory()))
        sut.tasks = tasks

        cellConfigurationBlock = { (cell, object) in
            cell.textLabel!.text = object.id
        }
    }

    override func tearDown(){
        sut = nil
        fakeOutput = nil
        tasks = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(output:)

    func testInit() {
        // when
        let interactor = TasksListInteractor(output: fakeOutput)

        // then
        XCTAssertNotNil(interactor.output)
    }

    // MARK: - loadDataSource(for:cellConfigurationBlock:)

    func testLoadDataSource() {
        // given
        let tableView = UITableView(frame: .zero)
        let list = List()

        // when
        sut.loadDataSource(
            for: tableView,
            with: list,
            cellConfigurationBlock: cellConfigurationBlock)

        // then
        XCTAssertEqual(sut.list, list)
        XCTAssertNotNil(sut.dataSource.cellConfigurationBlock)
    }

    // MARK: - fetchData()

    func testFetchData() {
        // given
        let list = List()
        let task = Task()
        task.title = "Important task"
        task.listId = list.id
        try! tasks.add(task)
        let tableView = UITableView(frame: .zero)

        sut.list = list
        sut.loadDataSource(
            for: tableView,
            with: list,
            cellConfigurationBlock: cellConfigurationBlock)

        // when
        sut.fetchData()

        // then
        XCTAssert(sut.dataSource.objects.contains(task))
        XCTAssertTrue(fakeOutput.didCallUpdateView)
    }

    // MARK: - newTask()

    func testNewTask() {
        // given
        sut.loadDataSource(
            for: UITableView(frame: .zero),
            with: List(),
            cellConfigurationBlock: cellConfigurationBlock)

        // when
        let task = sut.newTask()

        // then
        XCTAssertNotNil(task)
        XCTAssertNil(task.title)
    }
}
