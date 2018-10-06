//
//  TasksListViewControllerTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS

class TasksListViewControllerTests: XCTestCase {

    var sut: TasksListViewController!
    var fakePresenter: FakeTasksListPresenter!
    var window: UIWindow!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        window = UIWindow()
        let storyboard = UIStoryboard(name: "TasksList", bundle: nil)
        sut = (storyboard.instantiateInitialViewController() as! TasksListViewController)

        fakePresenter = FakeTasksListPresenter(view: sut)
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

    func testOutlets() {
        XCTAssertNotNil(sut.tableView)
    }
}
