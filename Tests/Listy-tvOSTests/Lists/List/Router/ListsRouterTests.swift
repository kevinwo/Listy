//
//  ListsRouterTests.swift
//  Listy-tvOSTests
//
//  Created by Kevin Wolkober on 11/28/18.
//

import XCTest
@testable import Listy_tvOS
@testable import ListyUI
@testable import ListyKit

class ListsRouterTests: XCTestCase {

    var sut: ListsRouter!
    var fakeOutput: FakeListsRouterOutput!

    override func setUp() {
        fakeOutput = FakeListsRouterOutput()
        sut = ListsRouter()
        sut.output = fakeOutput
    }

    override func tearDown() {
        sut = nil
        fakeOutput = nil
        FileManager().clearTemporaryDirectory()
    }

    // MARK: - Tests

    // MARK: - Scene

    func testSceneView() {
        // given
        let (lists, tasks) = listsAndTasks()

        // when
        let navigationController = ListsRouter.scene(lists: lists, tasks: tasks)

        // then
        XCTAssert(navigationController.topViewController is ListsViewController)

        let controller = navigationController.topViewController as! ListsViewController
        XCTAssert(controller.presenter is ListsPresenter)
    }

    func testScenePresenter() {
        // given
        let (lists, tasks) = listsAndTasks()

        // when
        let navigationController = ListsRouter.scene(lists: lists, tasks: tasks)

        // then
        XCTAssert(navigationController.topViewController is ListsViewController)

        let controller = navigationController.topViewController as! ListsViewController
        guard controller.presenter != nil else {
            XCTFail("Presenter should not be nil")
            return
        }

        // assert presenter and its components
        let presenter = controller.presenter as! ListsPresenter
        XCTAssert(presenter.output is ListsViewController)

        let presenterOutput = presenter.output as! ListsViewController
        XCTAssertEqual(presenterOutput, controller)
        XCTAssert(presenter.router is ListsRouter)
        XCTAssert(presenter.interactor is ListsInteractor)
    }

    func testSceneRouter() {
        // given
        let (lists, tasks) = listsAndTasks()

        // when
        let navigationController = ListsRouter.scene(lists: lists, tasks: tasks)

        // then
        XCTAssert(navigationController.topViewController is ListsViewController)

        let controller = navigationController.topViewController as! ListsViewController
        guard let router = controller.presenter.router as? ListsRouter else {
            XCTFail("TasksListRouter should be present")
            return
        }

        XCTAssert(router.output is ListsViewController)

        let routerOutput = router.output as! ListsViewController
        XCTAssertEqual(routerOutput, controller)
    }

    func testSceneInteractor() {
        // given
        let (lists, tasks) = listsAndTasks()

        // when
        let navigationController = ListsRouter.scene(lists: lists, tasks: tasks)

        // then
        XCTAssert(navigationController.topViewController is ListsViewController)

        let controller = navigationController.topViewController as! ListsViewController
        guard let interactor = controller.presenter.interactor as? ListsInteractor else {
            XCTFail("TasksListInteractor should be present")
            return
        }

        XCTAssert(interactor.output is ListsPresenter)
    }

    // MARK: - showConfirmDeleteAlert(title:confirmActionTitle:cancelActionTitle:confirmAction:)

    func testShowConfirmDeleteAlert() {
        // given
        let title = "Are you sure you want to delete Cool List?"
        let confirmTitle = "Delete"
        let cancelTitle = "Cancel"
        let confirm = { () -> Void in
        }

        // when
        sut.showConfirmDeleteAlert(title: title, confirmActionTitle: confirmTitle, cancelActionTitle: cancelTitle, confirmAction: confirm)

        // then
        XCTAssertTrue(fakeOutput.didCallPresentView)

        guard let controller = fakeOutput.presentedView as? UIAlertController else {
            XCTFail("Presented view should be of type UIAlertController"); return
        }

        XCTAssertEqual(controller.title, title)

        guard let confirmAction = controller.actions.filter({ $0.title == confirmTitle }).first else {
            XCTFail("Confirm action should be present"); return
        }
        XCTAssertEqual(confirmAction.style, .destructive)

        guard let cancelAction = controller.actions.filter({ $0.title == cancelTitle }).first else {
            XCTFail("Cancel action should be present"); return
        }
        XCTAssertEqual(cancelAction.style, .cancel)
    }

    // MARK: - Private interface

    func listsAndTasks() -> (Lists, Tasks) {
        let database = Database.newInstance(path: NSTemporaryDirectory())
        let lists = Lists(database: database)
        let tasks = Tasks(database: database)

        return (lists, tasks)
    }
}
