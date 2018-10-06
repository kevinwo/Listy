//
//  EditTaskPresenterTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS

class EditTaskPresenterTests: XCTestCase {

    var sut: EditTaskPresenter!
    var controller: EditTaskViewController!
    var fakeInteractor: FakeEditTaskInteractor!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "EditTask", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController)
        sut = EditTaskPresenter(view: controller)

        fakeInteractor = FakeEditTaskInteractor(output: sut)
        sut.interactor = fakeInteractor

        controller.presenter = sut
        _ = controller.view
    }

    override func tearDown() {
        sut = nil
        controller = nil
        fakeInteractor = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(view:)

    func testInitWithView() {
        // when
        let presenter = EditTaskPresenter(view: controller)

        // then
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
    }
}
