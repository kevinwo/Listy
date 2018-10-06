//
//  EditTaskInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS

class EditTaskInteractorTests: XCTestCase {

    var sut: EditTaskInteractor!
    var fakePresenter: FakeEditTaskPresenter!
    var controller: EditTaskViewController!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "EditTask", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController)

        fakePresenter = FakeEditTaskPresenter(view: controller)
        controller.presenter = fakePresenter

        sut = EditTaskInteractor(output: fakePresenter)
        fakePresenter.interactor = sut

        _ = controller.view
    }

    override func tearDown(){
        sut = nil
        fakePresenter = nil
        controller = nil

        super.tearDown()
    }

    // MARK: - Tests

    func testInit() {
        // when
        let interactor = EditTaskInteractor(output: fakePresenter)

        // then
        XCTAssertEqual(interactor.output, fakePresenter)
    }
}
