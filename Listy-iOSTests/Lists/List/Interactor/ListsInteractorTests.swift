//
//  ListsInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class ListsInteractorTests: XCTestCase {

    var sut: ListsInteractor!
    var fakeOutput: FakeListsInteractorOutput!
    var cellConfigurationBlock: TableViewDataSource.CellConfigurationBlock!
    var lists: Lists!
    var tasks: Tasks!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let database = Database.newInstance(path: NSTemporaryDirectory())
        lists = Lists(database: database)
        tasks = Tasks(database: database)
        fakeOutput = FakeListsInteractorOutput()

        sut = ListsInteractor(lists: lists, tasks: tasks)
        sut.output = fakeOutput

        cellConfigurationBlock = { (cell, object) in
            cell.textLabel!.text = object.id
        }
    }

    override func tearDown() {
        sut = nil
        lists = nil
        cellConfigurationBlock = nil
        FileManager().clearTemporaryDirectory()

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(output:)

    func testInit() {
        // when
        let interactor = ListsInteractor(lists: lists, tasks: tasks)

        // then
        XCTAssertNotNil(interactor.lists)
        XCTAssertNotNil(interactor.tasks)
    }

    // MARK: - fetchData()

    func testFetchData() {
        // given
        let list = List()
        list.title = "Cool List"
        try! lists.add(list)

        // when
        sut.fetchData()

        // then
        XCTAssert(fakeOutput.lists?.contains(list) ?? false)
        XCTAssertTrue(fakeOutput.didCallUpdateView)
    }

    // MARK: - newList()

    func testNewList() {
        // when
        let list = sut.newList()

        // then
        XCTAssertNotNil(list)
        XCTAssertNil(list.title)
    }
}
