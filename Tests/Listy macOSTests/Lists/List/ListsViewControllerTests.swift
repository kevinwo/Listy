//
//  ListsViewControllerTests.swift
//  Listy macOSTests
//
//  Created by Kevin Wolkober on 11/30/18.
//

import XCTest
@testable import Listy
@testable import ListyKit

class ListsViewControllerTests: XCTestCase {

    var sut: ListsViewController!
    var fakePresenter: FakeListsPresenterInput!

    override func setUp() {
        let storyboard = NSStoryboard(name: "Lists", bundle: nil)
        sut = (storyboard.instantiateInitialController() as! ListsViewController)

        fakePresenter = FakeListsPresenterInput()
        sut.presenter = fakePresenter

        let _ = sut.view
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: - Tests

    // MARK: - Outlets

    func testOutlets() {
        XCTAssertNotNil(sut.tableView)
        XCTAssertNotNil(sut.addListButton)
    }

    // MARK: - viewDidLoad()

    func testViewDidLoad() {
        XCTAssert(sut.tableView.dataSource is TableViewDataSource)
        XCTAssert(sut.tableView.delegate is ListsViewTableViewDelegate)
    }

    // MARK: - addListButtonTapped()

    func testAddListButtonTapped() {
        // when
        sut.addListButton.tap()

        // then
        XCTAssertTrue(fakePresenter.didCallAddList)
    }
}

// MARK: - MacListsRouterOutput

extension ListsViewControllerTests {

    // MARK: - addRow(with:)

    func testAddRow() {
        // given
        let list = List()

        // when
        sut.addRow(with: list)

        // then
        XCTAssert(sut.tableViewDataSource.objects.contains(list))

        // @TODO Use synchronous testing approach
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            guard let lastCellView = self.sut.tableView.view(atColumn: 0, row: self.sut.tableView.numberOfRows - 1, makeIfNecessary: false) as? NSTableCellView else {
                XCTFail("Last row must exist as NSTableCellView"); return
            }

            XCTAssertEqual(lastCellView.textField?.stringValue, list.title)
        }
    }
}

// MARK: - NSTextFieldDelegate

extension ListsViewControllerTests {

    // MARK: - controlTextDidEndEditing(_:)

    func testControlTextDidEndEditing() {
        // given
        let textField = NSTextField(string: "Cool List")
        var obj = Notification(name: Notification.Name("TextFieldNotification"))
        obj.object = textField

        // when
        sut.controlTextDidEndEditing(obj)

        // then
        XCTAssertTrue(fakePresenter.didCallSaveList)
        XCTAssertEqual(fakePresenter.saveListTitle, textField.stringValue)
    }
}
