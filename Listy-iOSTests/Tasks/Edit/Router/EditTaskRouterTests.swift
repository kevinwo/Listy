//
//  EditTaskRouterTests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/19/18.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class EditTaskRouterTests: XCTestCase {

    var sut: EditTaskRouter!
    var fakeView: FakeEditTaskRouterOutput!

    override func setUp() {
        fakeView = FakeEditTaskRouterOutput()
        sut = EditTaskRouter(view: fakeView)
    }

    override func tearDown() {
        sut = nil
        fakeView = nil
    }

    // MARK: - Tests

    // MARK: - scene(task:delegate:)

    func testScene() {
        // given
        let task = Task()
        let delegate = FakeEditTaskViewControllerDelegate()

        // when
        let controller = EditTaskRouter.scene(task: task, delegate: delegate)

        // then
        XCTAssert(controller.topViewController is EditTaskViewController)

        let editViewController = controller.topViewController as! EditTaskViewController
        XCTAssertEqual(editViewController.task, task)
    }

    // MARK: - finishWithCancel()

    func testFinishWithCancel() {
        // when
        sut.finishWithCancel()

        // then
        XCTAssertTrue(fakeView.didFinishWithCancel);
    }

    // MARK: - finishWithSave()

    func testFinishWithSave() {
        // given
        let task = Task()

        // when
        sut.finishWithSaving(task)

        // then
        XCTAssertTrue(fakeView.didFinishWithSave);
        XCTAssertEqual(fakeView.savedTask, task)
    }
}
