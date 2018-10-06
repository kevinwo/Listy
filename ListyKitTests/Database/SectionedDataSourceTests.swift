//
//  SectionedDataSourceTests.swift
//  ListyKitTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import XCTest
@testable import ListyKit

class SectionedDataSourceTests: XCTestCase {

    var objects: [Object]!
    var sut: SectionedDataSource!

    override func setUp() {
        sut = SectionedDataSource()
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Tests

    // MARK: - init(object:)

    func testInit_WhenObjectsArePresent() {
        // given
        let object1 = Object()
        let object2 = Object()

        // when
        let dataSource = SectionedDataSource(objects: [object1, object2])

        // then
        XCTAssertNotNil(dataSource.sections.first)
        XCTAssertNotNil(dataSource.sections.first?.first)
        XCTAssertEqual(dataSource.sections.first?.first, object1)
    }

    func testInit_WhenObjectsAreNotPresent() {
        // when
        let dataSource = SectionedDataSource()

        // then
        XCTAssertTrue(dataSource.sections.isEmpty)
    }

    // MARK: - Properties

    func testGetObjects() {
        // given
        let object1 = Object()
        let object2 = Object()
        let dataSource = SectionedDataSource(objects: [object1, object2])

        // when
        let objects = dataSource.objects

        // then
        XCTAssertNotNil(dataSource.sections.first)
        XCTAssertNotNil(dataSource.sections.first?.first)
        XCTAssertNotNil(objects)
        XCTAssertNotNil(objects?.first)
        XCTAssertEqual(dataSource.sections.first?.first, objects?.first)
    }
}
