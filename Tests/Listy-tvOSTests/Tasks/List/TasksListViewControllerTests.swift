//
//  TasksListViewControllerTests.swift
//  Listy-tvOSTests
//
//  Created by Kevin Wolkober on 12/2/18.
//

import XCTest
@testable import Listy_tvOS
@testable import ListyUI

class TasksListViewControllerTests: XCTestCase {

    var sut: TasksListViewController!
    var fakePresenter: FakeTasksListPresenterInput!

    // MARK: - Test lifecycle

    override func setUp() {
        let storyboard = UIStoryboard(name: "TasksList", bundle: nil)
        sut = (storyboard.instantiateInitialViewController() as! TasksListViewController)

        fakePresenter = FakeTasksListPresenterInput()
        sut.presenter = fakePresenter

        _ = sut.view
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Tests

    // MARK: - Outlets

    func testOutlets() {
        XCTAssertNotNil(sut.tableView)
    }
}
