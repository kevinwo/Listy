//
//  TasksListViewTableViewDelegateTests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/26/18.
//

import XCTest
@testable import Listy_iOS
@testable import ListyUI

class TasksListViewTableViewDelegateTests: XCTestCase {

    var sut: TasksListViewTableViewDelegate!

    override func setUp() {
        sut = TasksListViewTableViewDelegate()
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Tests

    // MARK: - tableView(_:didSelectRowAt:)

    func testTableViewDidSelectRowAtIndexPath() {
        // given
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)
        var didCallSelectRowHandler: Bool = false
        sut.didSelectRowHandler = { (indexPath) in
            didCallSelectRowHandler = true
        }

        // when
        sut.tableView(tableView, didSelectRowAt: indexPath)

        // then
        XCTAssertTrue(didCallSelectRowHandler)
    }

    // MARK: - tableView(_:editingStyleForRowAt:)

    func testTableViewEditingStyleForRowAtIndexPath() {
        // given
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)

        // when
        let editingStyle = sut.tableView(tableView, editingStyleForRowAt:   indexPath)

        // then
        XCTAssertEqual(editingStyle, .delete)
    }

    // MARK: - tableView(_:editActionsForRowAt:)

    func testTableViewEditActionsForRowAtIndexPath() {
        // given
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)
        sut.deleteRowHandler = { (indexPath) in }

        // when
        let actions = sut.tableView(tableView, editActionsForRowAt: indexPath)

        // then
        let deleteAction = actions?.filter({ $0.style == .destructive }).first
        XCTAssertNotNil(deleteAction)
    }
}
