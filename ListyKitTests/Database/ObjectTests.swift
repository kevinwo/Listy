//
//  ObjectTests.swift
//  ListyKitTests
//
//  Created by Kevin Wolkober on 10/5/18.
//

import XCTest
@testable import ListyKit

class ObjectTests: XCTestCase {

    var sut: Object!

    override func setUp() {
        sut = Object()
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Tests

    // MARK: - init()

    func testInit() {
        XCTAssertNotNil(sut.id)
    }

    // MARK: - Encoding and decoding

    func testEncodingAndDecoding() {
        // given
        let object = Object()
        let jsonEncoder = JSONEncoder()
        let initialJsonData = try! jsonEncoder.encode(object)
        let json = String(data: initialJsonData, encoding: .utf8)!

        // when
        let jsonDecoder = JSONDecoder()
        let jsonData = json.data(using: .utf8)!
        let decodedObject = try! jsonDecoder.decode(Object.self, from: jsonData)

        // then
        XCTAssertEqual(object.id, decodedObject.id)
    }
}
