//
//  EditListPresenterTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class EditListPresenterTests: XCTestCase {

    var sut: EditListPresenter!
    var fakeOutput: FakeEditListPresenterOutput!
    var fakeRouter: FakeEditListRouterInput!
    var fakeInteractor: FakeEditListInteractorInput!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let presenter = EditListPresenter()

        fakeOutput = FakeEditListPresenterOutput()
        fakeRouter = FakeEditListRouterInput()
        fakeInteractor = FakeEditListInteractorInput(list: List(), lists: Lists(database: Database.newInstance(path: NSTemporaryDirectory())))

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
        let title = "Cool List"

        // when
        sut.save(title: title)

        // then
        XCTAssertTrue(fakeInteractor.didCallSaveList)
    }

    func testSave_WhenTitleIsNotPresent() {
        // given
        let title: String? = nil

        // when
        sut.save(title: title)

        // then
        XCTAssertFalse(fakeInteractor.didCallSaveList)
    }
}

// MARK: - EditListPresenterOutput

extension EditListPresenterTests {

    // MARK: - finish(with:)

    func testFinish() {
        // given
        let list = List()
        list.title = "Cool List"

        // when
        sut.finish(with: list)

        // then
        XCTAssertTrue(fakeRouter.didCallFinishWithSaving)
        XCTAssertEqual(fakeRouter.listDidFinishWithSaving, list)
    }

    // MARK: - failedToSaveList(with:)

    func testFailedToSaveList() {
        // given
        let error = NSError()

        // when
        sut.failedToSaveList(with: error)

        // then
        XCTAssertTrue(fakeOutput.didCallShowErrorAlert)
        XCTAssertEqual(fakeOutput.errorToShowInAlert, error)
    }
}
