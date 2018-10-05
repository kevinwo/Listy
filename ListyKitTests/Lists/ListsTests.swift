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

    func testInit() {
        XCTAssertEqual(sut.database.path, database.path)
    }
}
