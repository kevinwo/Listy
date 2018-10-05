//
//  ListTests.swift
//  ListyKitTests
//
//  Created by Kevin Wolkober on 10/5/18.
//

import XCTest
@testable import ListyKit

class ListTests: XCTestCase {

    var sut: List!

    override func setUp() {
        sut = List()
    }

    override func tearDown() {
        sut = nil
    }

    func testSetTitle() {
        // given
        let title = "Cool List"

        // when
        sut.title = title

        // then
        XCTAssertEqual(title, sut.title)
    }
}
