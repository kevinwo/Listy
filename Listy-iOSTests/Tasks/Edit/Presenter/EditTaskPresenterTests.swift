//
//  EditTaskPresenterTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class EditTaskPresenterTests: XCTestCase {

    var sut: EditTaskPresenter!
    var fakeOutput: FakeEditTaskPresenterOutput!
    var fakeRouter: FakeEditTaskRouterInput!
    var fakeInteractor: FakeEditTaskInteractorInput!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let presenter = EditTaskPresenter()

        fakeOutput = FakeEditTaskPresenterOutput()
        fakeRouter = FakeEditTaskRouterInput()
        fakeInteractor = FakeEditTaskInteractorInput(task: Task(), tasks: Tasks(database: Database.newInstance(path: NSTemporaryDirectory())))

        presenter.output = fakeOutput
        presenter.router = fakeRouter
        presenter.interactor = fakeInteractor

        sut = presenter
    }

    override func tearDown() {
        sut = nil
        fakeRouter = nil
        fakeInteractor = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - cancel()

    func testCancel() {
        // when
        sut.cancel()

        // then
        XCTAssertTrue(fakeRouter.didCallFinishWithCancel)
    }

    // MARK: - save()

    func testSave_WhenTitleIsPresent() {
        // given
        let title = "Important task"

        // when
        sut.save(title: title)

        // then
        XCTAssertTrue(fakeInteractor.didCallSaveTask)
    }

    func testSave_WhenTitleIsNotPresent() {
        // given
        let title: String? = nil

        // when
        sut.save(title: title)

        // then
        XCTAssertFalse(fakeInteractor.didCallSaveTask)
    }
}

// MARK: - EditTaskPresenterOutput

extension EditTaskPresenterTests {

    // MARK: - finish(with:)

    func testFinish() {
        // given
        let task = Task()

        // when
        sut.finish(with: task)

        // then
        XCTAssertTrue(fakeRouter.didCallFinishWithSaving)
        XCTAssertEqual(fakeRouter.taskDidFinishWithSaving, task)
    }

    // MARK: - failedToSaveTask(with:)

    func testFailedToSaveTask() {
        // given
        let error = NSError()

        // when
        sut.failedToSaveTask(with: error)

        // then
        XCTAssertTrue(fakeOutput.didCallShowErrorAlert)
        XCTAssertEqual(fakeOutput.errorToShowInAlert, error)
    }
}
