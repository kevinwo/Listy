//
//  TasksListRouterTests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/19/18.
//

import XCTest
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class TasksListRouterTests: XCTestCase {

    var sut: TasksListRouter!
    var fakeOutput: FakeTasksListRouterOutput!

    override func setUp() {
        fakeOutput = FakeTasksListRouterOutput()
        sut = TasksListRouter()
        sut.output = fakeOutput
    }

    override func tearDown() {
        sut = nil
        fakeOutput = nil
    }

    // MARK: - Tests

    // MARK: - Scene

    func testSceneView() {
        // given
        let list = List()

        // when
        let controller = TasksListRouter.scene(list: list)

        // then
        XCTAssert(controller.presenter is TasksListPresenter)
    }

    func testScenePresenter() {
        // given
        let list = List()

        // when
        let controller = TasksListRouter.scene(list: list)

        // then
        guard controller.presenter != nil else {
            XCTFail("Presenter should not be nil")
            return
        }

        // assert presenter and its components
        let presenter = controller.presenter as! TasksListPresenter
        XCTAssert(presenter.output is TasksListViewController)

        let presenterOutput = presenter.output as! TasksListViewController
        XCTAssertEqual(presenterOutput, controller)
        XCTAssert(presenter.router is TasksListRouter)
        XCTAssert(presenter.interactor is TasksListInteractor)
    }

    func testSceneRouter() {
        // given
        let list = List()

        // when
        let controller = TasksListRouter.scene(list: list)

        // then
        guard let router = controller.presenter.router as? TasksListRouter else {
            XCTFail("TasksListRouter should be present")
            return
        }

        XCTAssert(router.output is TasksListViewController)

        let routerOutput = router.output as! TasksListViewController
        XCTAssertEqual(routerOutput, controller)
    }

    func testSceneInteractor() {
        // given
        let list = List()

        // when
        let controller = TasksListRouter.scene(list: list)

        // then
        guard let interactor = controller.presenter.interactor as? TasksListInteractor else {
            XCTFail("TasksListInteractor should be present")
            return
        }

        XCTAssert(interactor.output is TasksListPresenter)
    }

    // MARK: - showEditTaskView(with:)

    func testShowEditTaskView() {
        // given
        let task = Task()

        // when
        sut.showEditTaskView(with: task)

        // then
        XCTAssertTrue(fakeOutput.didCallPresentView)
        XCTAssert(fakeOutput.presentedView is UINavigationController)

        let navigationController = fakeOutput.presentedView as! UINavigationController
        XCTAssert(navigationController.topViewController is EditTaskViewController)
    }
}
