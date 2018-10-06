//
//  ListsListInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS

class ListsListInteractorTests: XCTestCase {

    var sut: ListsListInteractor!
    var presenter: ListsListPresenter!
    var controller: ListsListViewController!
    var window: UIWindow!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        window = UIWindow()
        let storyboard = UIStoryboard(name: "ListsList", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "ListsListViewController") as! ListsListViewController)
        presenter = controller.presenter
        sut = ListsListInteractor(output: presenter)

        presenter.interactor = sut
        _ = controller.view
    }

    override func tearDown() {
        sut = nil
        presenter = nil
        controller = nil
        window = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(output:)

    func testInit() {
        XCTAssertNotNil(sut.output)
    }
}
