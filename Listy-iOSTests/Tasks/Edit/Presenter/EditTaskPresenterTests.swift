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
    var controller: EditTaskViewController!
    var fakeDelegate: FakeEditTaskViewControllerDelegate!
    var fakeRouter: FakeEditTaskRouterInput!
    var fakeInteractor: FakeEditTaskInteractorInput!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "EditTask", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController)
        sut = EditTaskPresenter()
        sut.view = controller

        fakeInteractor = FakeEditTaskInteractorInput(task: Task(), tasks: Tasks(database: Database.newInstance(path: NSTemporaryDirectory())))
        fakeInteractor.output = sut
        sut.interactor = fakeInteractor

        fakeRouter = FakeEditTaskRouterInput()
        sut.router = fakeRouter

        fakeDelegate = FakeEditTaskViewControllerDelegate()
        controller.delegate = fakeDelegate

        controller.presenter = sut
        _ = controller.view
    }

    override func tearDown() {
        sut = nil
        controller = nil
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
