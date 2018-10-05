//
//  DatabaseTests.swift
//  ListyKitTests
//
//  Created by Kevin Wolkober on 10/5/18.
//

import XCTest
@testable import ListyKit

class DatabaseTests: XCTestCase {

    var sut: Database!

    override func setUp() {
        sut = Database()
    }

    override func tearDown() {
        sut = nil
    }
}
