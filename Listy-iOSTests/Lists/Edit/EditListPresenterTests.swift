//
//  EditListPresenterTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS

class EditListPresenterTests: XCTestCase {

    var sut: EditListPresenter!
    var controller: EditListViewController!
    var fakeDelegate: FakeEditListViewControllerDelegate!
    var fakeInteractor: FakeEditListInteractor!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "EditList", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "EditListViewController") as! EditListViewController)
        sut = EditListPresenter(view: controller)

        fakeInteractor = FakeEditListInteractor(output: sut)
        sut.interactor = fakeInteractor

        fakeDelegate = FakeEditListViewControllerDelegate()
        controller.delegate = fakeDelegate

        controller.presenter = sut
        _ = controller.view
    }

    override func tearDown() {
        sut = nil
        controller = nil
        fakeDelegate = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(view:)

    func testInitWithView() {
        // when
        let presenter = EditListPresenter(view: controller)

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
        controller.titleTextField.text = "Cool List"

        // when
        sut.save()

        // then
        XCTAssertTrue(fakeInteractor.didCallSaveList)
    }

    func testSave_WhenTitleIsNotPresent() {
        // given
        controller.titleTextField.text = nil

        // when
        sut.save()

        // then
        XCTAssertFalse(fakeInteractor.didCallSaveList)
    }
}
