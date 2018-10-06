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
    var fakeInteractor: FakeEditTaskInteractor!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "EditTask", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController)
        controller.task = Task()
        sut = EditTaskPresenter(view: controller)

        fakeInteractor = FakeEditTaskInteractor(output: sut)
        sut.interactor = fakeInteractor

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

    // MARK: - init(view:)

    func testInitWithView() {
        // when
        let presenter = EditTaskPresenter(view: controller)

        // then
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
    }

    // MARK: - cancel()

    func testCancel() {
        // when
        sut.cancel()

        // then
        XCTAssertTrue(fakeDelegate.didCallCancelWithController)
    }

    // MARK: - save()

    func testSave_WhenTitleIsPresent() {
        // given
        controller.titleTextField.text = "Important task"

        // when
        sut.save()

        // then
        XCTAssertTrue(fakeInteractor.didCallSaveTask)
    }

    func testSave_WhenTitleIsNotPresent() {
        // given
        controller.titleTextField.text = nil

        // when
        sut.save()

        // then
        XCTAssertFalse(fakeInteractor.didCallSaveTask)
    }
}
