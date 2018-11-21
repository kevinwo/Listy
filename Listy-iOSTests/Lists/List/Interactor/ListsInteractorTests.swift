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

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        FileManager().clearTemporaryDirectory()

        fakeOutput = FakeListsInteractorOutput()
        sut = ListsInteractor(output: fakeOutput)

        lists = Lists(database: Database.newInstance(path: NSTemporaryDirectory()))
        sut.lists = lists

        cellConfigurationBlock = { (cell, object) in
            cell.textLabel!.text = object.id
        }
    }

    override func tearDown() {
        sut = nil
        lists = nil
        cellConfigurationBlock = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(output:)

    func testInit() {
        // when
        let interactor = ListsInteractor(output: fakeOutput)

        // then
        XCTAssertNotNil(interactor.output)
        XCTAssertNotNil(interactor.lists)
    }

    // MARK: - loadDataSource(for:cellConfigurationBlock:)

    func testLoadDataSource() {
        // given
        let tableView = UITableView()

        // when
        sut.loadDataSource(for: tableView, cellConfigurationBlock: cellConfigurationBlock)

        // then
        XCTAssertNotNil(sut.dataSource.cellConfigurationBlock)
    }

    // MARK: - fetchData()

    func testFetchData() {
        // given
        let tableView = UITableView()
        let list = List()
        list.title = "Cool List"
        try! lists.add(list)
        sut.loadDataSource(for: tableView, cellConfigurationBlock: cellConfigurationBlock)

        // when
        sut.fetchData()

        // then
        XCTAssert(sut.dataSource.objects.contains(list))
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

    // MARK: - list(at:)

    func testListAtIndexPath() {
        // given
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)
        let list = List()
        list.title = "Cool List"
        try! lists.add(list)
        sut.loadDataSource(for: tableView, cellConfigurationBlock: cellConfigurationBlock)
        sut.fetchData()

        // when
        let fetchedList = sut.list(at: indexPath)

        // then
        XCTAssertEqual(fetchedList, list)
    }
}
