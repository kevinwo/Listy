//
//  ListsViewTableViewDelegateTests.swift
//  Listy macOSTests
//
//  Created by Kevin Wolkober on 11/30/18.
//

import XCTest
@testable import Listy

class ListsViewTableViewDelegateTests: XCTestCase {

    var sut: ListsViewTableViewDelegate!

    override func setUp() {
        sut = ListsViewTableViewDelegate()
        sut.cellConfigurationBlock = { (cellView, row) in
            cellView.textField?.stringValue = "Cool List"
        }
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Tests

    // MARK: - tableView(_:viewFor:row:)

    func testTableViewViewForRow() {
        // given
        let identifier = NSUserInterfaceItemIdentifier(rawValue: "AutomaticTableColumnIdentifier.0")
        let tableColumn = NSTableColumn(identifier: identifier)

        let tableView = NSTableView(frame: .zero)
        tableView.delegate = sut
        tableView.dataSource = self

        let nib = NSNib(nibNamed: "TestCellView", bundle: Bundle(for: ListsViewTableViewDelegateTests.self))
        tableView.register(nib, forIdentifier: identifier)

        // when
        let view = sut.tableView(tableView, viewFor: tableColumn, row: 0)

        // then
        guard let cellView = view as? NSTableCellView else {
            XCTFail("View for row should be NSTableCellView"); return
        }

        XCTAssertEqual(cellView.textField?.stringValue, "Cool List")
    }
}

extension ListsViewTableViewDelegateTests: NSTableViewDataSource {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return 3
    }
}
