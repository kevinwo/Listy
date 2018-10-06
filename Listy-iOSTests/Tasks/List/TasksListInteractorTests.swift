//
//  TasksListInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS

class TasksListInteractorTests: XCTestCase {

    var sut: TasksListInteractor!
    var fakePresenter: FakeTasksListPresenter!
    var controller: TasksListViewController!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        FileManager().clearTemporaryDirectory()

        let storyboard = UIStoryboard(name: "TasksList", bundle: nil)
        controller = (storyboard.instantiateInitialViewController() as! TasksListViewController)

        fakePresenter = FakeTasksListPresenter(view: controller)
        controller.presenter = fakePresenter

        sut = TasksListInteractor(output: fakePresenter)
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

    // MARK: - init(output:)

    func testInit() {
        // when
        let interactor = TasksListInteractor(output: fakePresenter)

        // then
        XCTAssertNotNil(interactor.output)
    }
}
