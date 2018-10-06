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
    var fakePresenter: FakeTasksListPresenter!
    var controller: TasksListViewController!
    var cellConfigurationBlock: TableViewDataSource.CellConfigurationBlock!
    var tasks: Tasks!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        FileManager().clearTemporaryDirectory()

        let storyboard = UIStoryboard(name: "TasksList", bundle: nil)
        controller = (storyboard.instantiateInitialViewController() as! TasksListViewController)

        controller.list = List()

        fakePresenter = FakeTasksListPresenter(view: controller)
        controller.presenter = fakePresenter

        sut = TasksListInteractor(output: fakePresenter)
        fakePresenter.interactor = sut

        tasks = Tasks(database: Database.newInstance(path: NSTemporaryDirectory()))
        sut.tasks = tasks

        cellConfigurationBlock = { (cell, object) in
            cell.textLabel!.text = object.id
        }

        _ = controller.view
    }

    override func tearDown(){
        sut = nil
        fakePresenter = nil
        controller = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(output:)

    func testInit() {
        // when
        let interactor = TasksListInteractor(output: fakePresenter)

        // then
        XCTAssertNotNil(interactor.output)
    }

    // MARK: - loadDataSource(for:cellConfigurationBlock:)

    func testLoadDataSource() {
        // given
        let tableView = controller.tableView!

        // when
        sut.loadDataSource(
            for: tableView,
            with: controller.list,
            cellConfigurationBlock: cellConfigurationBlock)

        // then
        XCTAssertEqual(sut.dataSource.tableView, tableView)
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

        sut.list = list
        sut.loadDataSource(
            for: controller.tableView,
            with: list,
            cellConfigurationBlock: cellConfigurationBlock)

        // when
        sut.fetchData()

        // then
        XCTAssert(sut.dataSource.objects!.contains(task))
        XCTAssertTrue(fakePresenter.didCallUpdateView)
    }

    // MARK: - newTask()

    func testNewTask() {
        // given
        sut.loadDataSource(
            for: controller.tableView,
            with: controller.list,
            cellConfigurationBlock: cellConfigurationBlock)

        // when
        let task = sut.newTask()

        // then
        XCTAssertNotNil(task)
        XCTAssertNil(task.title)
    }
}
