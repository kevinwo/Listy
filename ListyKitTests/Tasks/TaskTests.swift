//
//  TaskTests.swift
//  ListyKitTests
//
//  Created by Kevin Wolkober on 10/5/18.
//

import XCTest
@testable import ListyKit

class TaskTests: XCTestCase {

    var sut: Task!

    override func setUp() {
        sut = Task()
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Tests

    // MARK: - Properties

    func testSetTitle() {
        // given
        let title = "Important task"

        // when
        sut.title = title

        // then
        XCTAssertEqual(title, sut.title)
    }

    func testSetListId() {
        // given
        let listId = "list-id"

        // when
        sut.listId = listId

        // then
        XCTAssertEqual(listId, sut.listId)
    }
}
