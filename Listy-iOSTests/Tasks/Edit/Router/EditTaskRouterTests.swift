//
//  EditTaskRouterTests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/19/18.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class EditTaskRouterTests: XCTestCase {

    var sut: EditTaskRouter!
    var fakeView: FakeEditTaskRouterOutput!

    override func setUp() {
        fakeView = FakeEditTaskRouterOutput()
        sut = EditTaskRouter(view: fakeView)
    }

    override func tearDown() {
        sut = nil
        fakeView = nil
    }

    // MARK: - Tests

    // MARK: - Scene

    func testSceneView() {
        // given
        let (task, delegate) = taskAndDelegate()

        // when
        let navigationController = EditTaskRouter.scene(task: task, delegate: delegate)

        // then
        let controller = assertSceneView(navigationController)

        XCTAssertEqual(controller.task, task)
        XCTAssert(controller.presenter is EditTaskPresenter)
        XCTAssert(controller.delegate is FakeEditTaskViewControllerDelegate)
    }

    func testScenePresenter() {
        // given
        let (task, delegate) = taskAndDelegate()

        // when
        let navigationController = EditTaskRouter.scene(task: task, delegate: delegate)

        // then
        let controller = assertSceneView(navigationController)

        guard controller.presenter != nil else {
            XCTFail("Presenter should not be nil"); return
        }
        guard let presenter = controller.presenter as? EditTaskPresenter else {
            XCTFail("Presenter should be edit task presenter"); return
        }
        guard let presenterOutput = presenter.view as? EditTaskViewController else {
            XCTFail("Presenter's output should be edit task view"); return
        }

        XCTAssertEqual(presenterOutput, controller)
        XCTAssert(presenter.router is EditTaskRouter)
        XCTAssert(presenter.interactor is EditTaskInteractor)
    }

    func testSceneRouter() {
        // given
        let (task, delegate) = taskAndDelegate()

        // when
        let navigationController = EditTaskRouter.scene(task: task, delegate: delegate)

        // then
        let controller = assertSceneView(navigationController)

        guard let router = controller.presenter.router as? EditTaskRouter else {
            XCTFail("Edit task router should be present"); return
        }
        guard let routerOutput = router.view as? EditTaskViewController else {
            XCTFail("Router output should be present"); return
        }

        XCTAssertEqual(routerOutput, controller)
    }

    func testSceneInteractor() {
        // given
        let (task, delegate) = taskAndDelegate()

        // when
        let navigationController = EditTaskRouter.scene(task: task, delegate: delegate)

        // then
        let controller = assertSceneView(navigationController)

        guard let interactor = controller.presenter.interactor as? EditTaskInteractor else {
            XCTFail("Edit task interactor should be present")
            return
        }

        XCTAssert(interactor.output is EditTaskPresenter)
    }

    // MARK: - finishWithCancel()

    func testFinishWithCancel() {
        // when
        sut.finishWithCancel()

        // then
        XCTAssertTrue(fakeView.didFinishWithCancel);
    }

    // MARK: - finishWithSave()

    func testFinishWithSave() {
        // given
        let task = Task()

        // when
        sut.finishWithSaving(task)

        // then
        XCTAssertTrue(fakeView.didFinishWithSave);
        XCTAssertEqual(fakeView.savedTask, task)
    }

    // MARK: - Private interface

    func taskAndDelegate() -> (Task, FakeEditTaskViewControllerDelegate) {
        return (Task(), FakeEditTaskViewControllerDelegate())
    }

    func assertSceneView(_ navigationController: UINavigationController) -> EditTaskViewController {
        guard let controller = navigationController.topViewController as? EditTaskViewController else {
            XCTFail("View should be edit task view");
            fatalError()
        }

        return controller
    }
}
