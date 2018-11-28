//
//  TableViewDataSourceTests.swift
//  ListyUITests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import XCTest
@testable import ListyUI
@testable import ListyKit

class TableViewDataSourceTests: XCTestCase {

    var tableView: UITableView!
    var cellConfigurationBlock: TableViewDataSource.CellConfigurationBlock!
    var sut: TableViewDataSource!

    override func setUp() {
        tableView = UITableView(frame: .zero)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Object")
        cellConfigurationBlock = { (cell, object) in
            cell.textLabel!.text = object.id
        }
        sut = TableViewDataSource(tableView: tableView, cellConfigurationBlock: cellConfigurationBlock)
    }

    override func tearDown() {
        sut = nil
        tableView = nil
        cellConfigurationBlock = nil
    }

    // MARK: - Tests

    // MARK: - init(tableView:cellConfigurationBlock:cellReuseIdentifier:objects:)

    func testInit_WhenTableViewAndCellConfigurationBlockArePresent() {
        XCTAssertNotNil(sut.cellConfigurationBlock)
        XCTAssert(tableView.dataSource is TableViewDataSource)
    }

    func testInit_WhenTableViewCellConfigurationBlockAndObjectsArePresent() {
        // given
        let object1 = Object()
        let object2 = Object()
        let objects = [object1, object2]

        // when
        let dataSource = TableViewDataSource(tableView: tableView, cellConfigurationBlock: cellConfigurationBlock, objects: objects)

        // then
        XCTAssertNotNil(dataSource.cellConfigurationBlock)
        XCTAssert(tableView.dataSource is TableViewDataSource)
        XCTAssertNotNil(dataSource.sections.first)
        XCTAssertNotNil(dataSource.sections.first?.first)
        XCTAssertEqual(dataSource.sections.first?.first, object1)
    }

    // MARK: - object(at:)

    func testObjectAtIndexPath() {
        // given
        let indexPath = IndexPath(row: 0, section: 1)
        let object1 = Object()
        let object2 = Object()
        let sections = [[object1], [object2]]
        sut.sections = sections

        // when
        let fetchedObject = sut.object(at: indexPath)

        // then
        XCTAssertEqual(fetchedObject, object2)
    }

    // MARK: - UITableViewDataSource

    // MARK: - numberOfSections(in:)

    func testNumberOfSectionsInTableView() {
        // given
        let object1 = Object()
        let object2 = Object()
        let sections = [[object1], [object2]]
        sut.sections = sections

        // when
        let numberOfSections = sut.numberOfSections(in: tableView)

        // then
        XCTAssertEqual(numberOfSections, 2)
    }

    // MARK: - tableView(_:numberOfRowsInSection:)

    func testTableViewNumberOfRowsInSection() {
        // given
        let section = 0
        let object1 = Object()
        let object2 = Object()
        let sections = [[object1, object2]]
        sut.sections = sections

        // when
        let numberOfRowsInSection = sut.tableView(tableView, numberOfRowsInSection: section)

        // then
        XCTAssertEqual(numberOfRowsInSection, 2)
    }

    // MARK: - tableView(_:cellForRowAt:)

    func testTableViewCellForRowAtIndexPath() {
        // given
        let indexPath = IndexPath(row: 1, section: 0)
        let object1 = Object()
        let object2 = Object()
        let sections = [[object1, object2]]
        sut.sections = sections

        // when
        let cell = sut.tableView(tableView, cellForRowAt: indexPath)

        // then
        XCTAssertEqual(cell.textLabel!.text, object2.id)
    }
}
