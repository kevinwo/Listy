//
//  DatabaseTests.swift
//  ListyKitTests
//
//  Created by Kevin Wolkober on 10/5/18.
//

import XCTest
@testable import ListyKit

class DatabaseTests: XCTestCase {

    let path = NSTemporaryDirectory()
    var sut: Database!

    override func setUp() {
        sut = Database(path: path)
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Tests

    // MARK: - init(path:) {

    func testInitPath() {
        XCTAssertEqual(sut.path, path)
    }

    // MARK: - object(ofType:id)

    func testObjectOfTypeId_WhenObjectExists() {
        // given
        let object = Object()
        try! sut.save(object)

        // when
        let fetchedObject = sut.object(ofType: Object.self, with: object.id)

        // then
        XCTAssertEqual(object, fetchedObject)
    }

    func testObjectOfTypeId_WhenObjectDoesNotExist() {
        // when
        let object = sut.object(ofType: Object.self, with: "cool-uuid")

        // then
        XCTAssertNil(object)
    }

    // MARK: - save(_:)

    func testSave_WhenObjectIsNew() {
        // given
        let object = Object()

        // when
        try! sut.save(object)

        // then
        let fetchedObject = sut.object(ofType: Object.self, with: object.id)
        XCTAssertEqual(object, fetchedObject)
        XCTAssertNotNil(object.dateCreated)
    }

    func testSave_WhenObjectIsNotNew() {
        // given
        let object = Object()
        try! sut.save(object)
        let existingObject = sut.object(ofType: Object.self, with: object.id)!

        // when
        try! sut.save(existingObject)

        // then
        let fetchedObject = sut.object(ofType: Object.self, with: object.id)
        XCTAssertEqual(existingObject, fetchedObject)
    }
}
