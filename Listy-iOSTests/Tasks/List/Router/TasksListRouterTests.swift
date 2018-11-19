//
//  TasksListRouterTests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/19/18.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class TasksListRouterTests: XCTestCase {

    var sut: TasksListRouter!
    var fakeView: FakeTasksListView!

    override func setUp() {
        fakeView = FakeTasksListView()
        sut = TasksListRouter(view: fakeView)
    }

    override func tearDown() {
        sut = nil
        fakeView = nil
    }

    // MARK: - Tests

    // MARK: - showEditTaskView(with:)

    func testShowEditTaskView() {
        // given
        let task = Task()

        // when
        sut.showEditTaskView(with: task)

        // then
        XCTAssertTrue(fakeView.didCallPresentView)
        XCTAssert(fakeView.presentedView is EditTaskViewController)

        let editViewController = fakeView.presentedView as! EditTaskViewController
        XCTAssertEqual(editViewController.task, task)
    }

}
