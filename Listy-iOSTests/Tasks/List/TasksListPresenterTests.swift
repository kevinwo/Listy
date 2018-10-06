//
//  TasksListPresenterTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class TasksListPresenterTests: XCTestCase {

    var sut: TasksListPresenter!
    var fakeRouter: FakeTasksListRouter!
    var fakeInteractor: FakeTasksListInteractor!
    var controller: TasksListViewController!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "TasksList", bundle: nil)
        controller = (storyboard.instantiateInitialViewController() as! TasksListViewController)
        controller.list = List()
        sut = TasksListPresenter(view: controller)

        fakeInteractor = FakeTasksListInteractor(output: sut)
        sut.interactor = fakeInteractor

        fakeRouter = FakeTasksListRouter(view: controller)
        sut.router = fakeRouter

        controller.presenter = sut
        _ = controller.view
    }

    override func tearDown() {
        sut = nil
        controller = nil
        fakeRouter = nil
        fakeInteractor = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(view:)

    func testInitWithView() {
        // when
        let presenter = TasksListPresenter(view: controller)

        // then
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
    }

    // MARK: - viewDidLoad()

    func testViewDidLoad() {
        // when
        sut.viewDidLoad()

        // then
        XCTAssertTrue(fakeInteractor.didCallLoadDataSource)
        XCTAssertTrue(fakeInteractor.didCallFetchData)
    }

    // MARK: - reloadData()

    func testReloadData() {
        // when
        sut.reloadData()

        // then
        XCTAssertTrue(fakeInteractor.didCallFetchData)
    }
}
