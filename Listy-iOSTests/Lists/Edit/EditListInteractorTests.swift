//
//  EditListInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class EditListInteractorTests: XCTestCase {

    var sut: EditListInteractor!
    var fakePresenter: FakeEditListPresenter!
    var controller: EditListViewController!
    var lists: Lists!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "EditList", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "EditListViewController") as! EditListViewController)

        fakePresenter = FakeEditListPresenter(view: controller)
        controller.presenter = fakePresenter

        sut = EditListInteractor(output: fakePresenter)
        fakePresenter.interactor = sut

        lists = Lists(database: Database.newInstance(path: NSTemporaryDirectory()))
        sut.lists = lists

        _ = controller.view
    }

    override func tearDown() {
        sut = nil
        fakePresenter = nil
        controller = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(output:)

    func testInit() {
        // when
        let interactor = EditListInteractor(output: fakePresenter)

        // then
        XCTAssertEqual(interactor.output, fakePresenter)
        XCTAssertNotNil(interactor.lists)
    }

    // MARK: - saveList(title:)

    func testSaveList_WhenSuccess() {
        // given
        let title = "Cool List"
        let allListsBeforeSave = lists.all()
        XCTAssertNil(allListsBeforeSave.filter({ $0.title == title }).first)

        // when
        sut.saveList(title: title)

        // then
        let allListsAfterSave = lists.all()
        XCTAssertNotNil(allListsAfterSave.filter({ $0.title == title }).first)
        XCTAssertTrue(fakePresenter.didCallUpdateView)
    }
}
