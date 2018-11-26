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
    var fakeInteractorInput: FakeEditTaskInteractorInput!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "EditTask", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController)
        controller.task = Task()
        sut = EditTaskPresenter(view: controller)

        fakeInteractorInput = FakeEditTaskInteractorInput(output: sut)
        sut.interactor = fakeInteractorInput

        fakeDelegate = FakeEditTaskViewControllerDelegate()
        controller.delegate = fakeDelegate

        controller.presenter = sut
        _ = controller.view
    }

    override func tearDown() {
        sut = nil
        controller = nil
        fakeInteractorInput = nil

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

    // MARK: - viewDidLoad()

    func testViewDidLoad() {
        // given
        controller.task = Task()

        // when
        sut.viewDidLoad()

        // then
        XCTAssertTrue(fakeInteractorInput.didCallLoadTask)
        XCTAssertEqual(fakeInteractorInput.loadedTask, controller.task)
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
        let title = "Important task"

        // when
        sut.save(title: title)

        // then
        XCTAssertTrue(fakeInteractorInput.didCallSaveTask)
    }

    func testSave_WhenTitleIsNotPresent() {
        // given
        let title: String? = nil

        // when
        sut.save(title: title)

        // then
        XCTAssertFalse(fakeInteractorInput.didCallSaveTask)
    }
}
