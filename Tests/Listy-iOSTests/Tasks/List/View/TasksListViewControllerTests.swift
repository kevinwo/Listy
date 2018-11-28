//
//  TasksListViewControllerTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class TasksListViewControllerTests: XCTestCase {

    var sut: TasksListViewController!
    var fakePresenter: FakeTasksListPresenterInput!
    var window: UIWindow!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        window = UIWindow()
        let storyboard = UIStoryboard(name: "TasksList", bundle: nil)
        sut = (storyboard.instantiateInitialViewController() as! TasksListViewController)

        fakePresenter = FakeTasksListPresenterInput()
        sut.presenter = fakePresenter

        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        window = nil
        fakePresenter = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - Outlets

    func testOutlets() {
        XCTAssertNotNil(sut.tableView)
        XCTAssertNotNil(sut.addBarButtonItem)
        XCTAssertEqual(sut.navigationItem.rightBarButtonItem, sut.addBarButtonItem)
    }

    // MARK: - viewDidLoad()

    func testViewDidLoad() {
        XCTAssert(sut.tableView.dataSource is TableViewDataSource)
        XCTAssert(sut.tableView.delegate is TasksListViewTableViewDelegate)
        XCTAssertTrue(fakePresenter.didCallReloadData)
    }

    // MARK: - Button actions

    func testAddBarButtonItemTapped() {
        // when
        sut.addBarButtonItem.tap()

        // then
        XCTAssertTrue(fakePresenter.didCallAddTask)
    }
}

// MARK: - TasksListPresenterOutput

extension TasksListViewControllerTests {

    // MARK: - updateView(title:tasks)

    func testUpdateView() {
        // given
        let list = List()
        list.title = "Cool List"

        let task = Task()
        task.title = "Cool Task"
        task.listId = list.id

        let tasks = [task]

        // when
        sut.updateView(title: list.title, tasks: tasks)

        // then
        XCTAssertEqual(sut.tableViewDataSource.sections.first, tasks)
        XCTAssertNotNil(sut.tableViewDataSource.cellConfigurationBlock)
        XCTAssertNotNil(sut.tableViewDelegate.deleteRowHandler)

        let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell?.textLabel?.text, task.title)
    }

    // MARK: - deleteRow(at:)

    func testDeleteRowAtIndexPath() {
        // given
        let indexPath = IndexPath(row: 0, section: 0)

        let list = List()
        list.title = "Cool List"

        let task = Task()
        task.title = "Cool Task"
        task.listId = list.id

        let tasks = [task]
        sut.updateView(title: list.title, tasks: tasks)

        XCTAssert((sut.tableViewDataSource.sections[indexPath.section] as? [Task])?.contains(task) ?? false)
        let beforeCell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(beforeCell?.textLabel?.text, task.title)

        // when
        sut.deleteRow(at: IndexPath(row: 0, section: 0))

        // then
        let section = sut.tableViewDataSource.sections[indexPath.section]
        XCTAssertFalse((section as? [Task])?.contains(task) ?? false)
        let afterCell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertNil(afterCell)
    }
}

// MARK: - TasksListRouterOutput

extension TasksListViewControllerTests {

    // MARK: - reloadData()

    func testReloadData() {
        // when
        sut.reloadData()

        // then
        XCTAssertTrue(fakePresenter.didCallReloadData)
    }
}
