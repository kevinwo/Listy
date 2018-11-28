//
//  EditListViewControllerTests.swift
//  Listy-tvOSTests
//
//  Created by Kevin Wolkober on 11/28/18.
//

import XCTest
@testable import Listy_tvOS
@testable import ListyUI
@testable import ListyKit

class EditListViewControllerTests: XCTestCase {

    var sut: EditListViewController!
    var fakePresenter: FakeEditListPresenterInput!
    var navigationController: UINavigationController!
    var window: UIWindow!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        window = UIWindow()
        let storyboard = UIStoryboard(name: "EditList", bundle: nil)
        navigationController = (storyboard.instantiateInitialViewController() as! UINavigationController)
        sut = (navigationController.topViewController as! EditListViewController)

        fakePresenter = FakeEditListPresenterInput()
        sut.presenter = fakePresenter

        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        navigationController = nil
        window = nil

        super.tearDown()
    }

    // MARK: - Tests

    func testOutlets() {
        XCTAssertNotNil(sut.tableView)
        XCTAssertNotNil(sut.cancelBarButtonItem)
        XCTAssertNotNil(sut.saveBarButtonItem)
        XCTAssertNotNil(sut.titleTextField)
    }

    // MARK: - tableView(didSelectRowAt:)

    func testTableDidSelectRow() {
        // given
        let tableView = UITableView()
        let indexPath = IndexPath(row: 0, section: 0)

        // when
        sut.tableView(tableView, didSelectRowAt: indexPath)

        // then
        // @TODO Use synchronous testing approach
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            XCTAssertTrue(self.sut.titleTextField.isFirstResponder)
        }
    }

    // MARK: - Button actions

    func testCancelBarButtonItemTapped() {
        // when
        sut.cancelBarButtonItem.tap()

        // then
        XCTAssertTrue(fakePresenter.didCancel)
    }

    func testSaveBarButtonItemTapped() {
        // when
        sut.saveBarButtonItem.tap()

        // then
        XCTAssertTrue(fakePresenter.didSave)
    }
}
