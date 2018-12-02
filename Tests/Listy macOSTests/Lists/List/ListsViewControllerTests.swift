//
//  ListsViewControllerTests.swift
//  Listy macOSTests
//
//  Created by Kevin Wolkober on 11/30/18.
//

import XCTest
@testable import Listy

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
