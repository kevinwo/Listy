//
//  SectionedDataSourceTests.swift
//  ListyKitTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import XCTest
@testable import ListyKit

class TestDataSource: SectionableDataSource {
    var sections: [[Object]]

    init(sections: [[Object]]) {
        self.sections = sections
    }
}

class SectionedDataSourceTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    // MARK: - Tests

    // MARK: - Properties

    func testGetObjects() {
        // given
        let object1 = Object()
        let object2 = Object()
        let dataSource = TestDataSource(sections: [[object1], [object2]])

        // when
        let objects = dataSource.objects

        // then
        XCTAssertNotNil(objects[0])
        XCTAssertNotNil(objects[1])
        XCTAssertEqual(objects[0], object1)
        XCTAssertEqual(objects[1], object2)
    }
}
