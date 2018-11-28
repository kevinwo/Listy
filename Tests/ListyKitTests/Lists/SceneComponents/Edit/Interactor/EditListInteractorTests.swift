//
//  EditListInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import ListyKit

class EditListInteractorTests: XCTestCase {

    var sut: EditListInteractor!
    var fakeOutput: FakeEditListInteractorOutput!
    var list: List!
    var lists: Lists!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        fakeOutput = FakeEditListInteractorOutput()
        list = List()
        lists = Lists(database: Database.newInstance(path: NSTemporaryDirectory()))

        sut = EditListInteractor(list: list, lists: lists)
        sut.output = fakeOutput
    }

    override func tearDown() {
        sut = nil
        fakeOutput = nil
        list = nil
        lists = nil

        FileManager().clearTemporaryDirectory()

        super.tearDown()
    }

    // MARK: - Tests

    func testInit() {
        XCTAssertEqual(sut.list, list)
        XCTAssert(sut.lists === lists)
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
        XCTAssertTrue(fakeOutput.didCallFinish)
    }
}
