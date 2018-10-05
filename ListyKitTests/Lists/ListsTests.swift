//
//  ListsTests.swift
//  ListyKitTests
//
//  Created by Kevin Wolkober on 10/5/18.
//

import XCTest
@testable import ListyKit

class ListsTests: XCTestCase {

    var database: Database!
    var sut: Lists!

    override func setUp() {
        database = Database.newInstance()
        sut = Lists(database: database)
    }

    override func tearDown() {
        database = nil
        sut = nil
    }

    // MARK: - Tests

    // MARK: - init()

    func testInit() {
        XCTAssertEqual(sut.database.path, database.path)
    }

    // MARK: - all()

    func testAll() {
        // given
        let list1 = List()
        list1.title = "First Cool List"
        try! sut.add(list1)

        let list2 = List()
        list2.title = "Second Cool List"
        try! sut.add(list2)

        // when
        let lists = sut.all()

        // then
        XCTAssertNotNil(lists.filter({ $0 == list1 }).first)
        XCTAssertNotNil(lists.filter({ $0 == list2 }).first)
    }

    // MARK: - fetch(_:)

    func testFetch_WhenListExists() {
        // given
        let list = List()
        list.title = "Cool List"
        try! sut.add(list)
        let id = list.id

        // when
        let fetchedList = sut.fetch(by: id)

        // then
        XCTAssertEqual(fetchedList, list)
    }

    func testFetch_WhenListDoesNotExist() {
        // given
        let id = "bad-id"

        // when
        let fetchedList = sut.fetch(by: id)

        // then
        XCTAssertNil(fetchedList)
    }

    // MARK: - add(_:)

    func testAdd_WhenSuccess() {
        // given
        let list = List()
        list.title = "Cool List"

        // when
        XCTAssertNoThrow(try sut.add(list))

        // then
        let id = list.id
        let fetchedList = sut.fetch(by: id)
        XCTAssertEqual(fetchedList, list)
    }

    func testAdd_WhenFails() {
        // given
        let badDatabase = Database(path: "/bad/path")
        let lists = Lists(database: badDatabase)

        let list = List()
        list.title = "Cool List"

        // when/then
        XCTAssertThrowsError(try lists.add(list))
    }
}
