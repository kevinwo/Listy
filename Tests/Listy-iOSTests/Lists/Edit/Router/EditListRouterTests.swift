//
//  EditListRouterTests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/27/18.
//

import XCTest
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class EditListRouterTests: XCTestCase {

    var sut: EditListRouter!
    var fakeOutput: FakeEditListRouterOutput!

    override func setUp() {
        fakeOutput = FakeEditListRouterOutput()
        sut = EditListRouter()
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
        let (list, delegate, lists) = sceneInitArguments()

        // when
        let navigationController = EditListRouter.scene(list: list, delegate: delegate, lists: lists)

        // then
        let controller = assertSceneView(navigationController)

        XCTAssert(controller.presenter is EditListPresenter)
        XCTAssert(controller.delegate is FakeEditListViewControllerDelegate)
    }

    func testScenePresenter() {
        // given
        let (list, delegate, lists) = sceneInitArguments()

        // when
        let navigationController = EditListRouter.scene(list: list, delegate: delegate, lists: lists)

        // then
        let controller = assertSceneView(navigationController)
        
        guard controller.presenter != nil else {
            XCTFail("Presenter should not be nil"); return
        }
        guard let presenter = controller.presenter as? EditListPresenter else {
            XCTFail("Presenter should be Edit list presenter"); return
        }

        XCTAssert(presenter.output === controller)
        XCTAssert(presenter.router is EditListRouter)
        XCTAssert(presenter.interactor is EditListInteractor)
    }
    
    func testSceneRouter() {
        // given
        let (list, delegate, lists) = sceneInitArguments()

        // when
        let navigationController = EditListRouter.scene(list: list, delegate: delegate, lists: lists)

        // then
        let controller = assertSceneView(navigationController)

        guard let router = controller.presenter.router as? EditListRouter else {
            XCTFail("Edit list router should be present"); return
        }
        guard let routerOutput = router.output as? EditListViewController else {
            XCTFail("Router output should be present"); return
        }

        XCTAssertEqual(routerOutput, controller)
    }
    
    func testSceneInteractor() {
        let (list, delegate, lists) = sceneInitArguments()

        // when
        let navigationController = EditListRouter.scene(list: list, delegate: delegate, lists: lists)

        // then
        let controller = assertSceneView(navigationController)

        guard let interactor = controller.presenter.interactor as? EditListInteractor else {
            XCTFail("Edit list interactor should be present")
            return
        }

        XCTAssert(interactor.output is EditListPresenter)
    }

    // MARK: - finishWithCancel()

    func testFinishWithCancel() {
        // when
        sut.finishWithCancel()

        // then
        XCTAssertTrue(fakeOutput.didFinishWithCancel);
    }

    // MARK: - finishWithSaving()

    func testFinishWithSaving() {
        // given
        let list = List()

        // when
        sut.finishWithSaving(list)

        // then
        XCTAssertTrue(fakeOutput.didFinishWithSave);
        XCTAssertEqual(fakeOutput.savedList, list)
    }

    // MARK: - Private interface

    func sceneInitArguments() -> (List, FakeEditListViewControllerDelegate, Lists) {
        let database = Database.newInstance(path: NSTemporaryDirectory())
        let lists = Lists(database: database)

        return (List(), FakeEditListViewControllerDelegate(), lists)
    }

    func assertSceneView(_ navigationController: UINavigationController) -> EditListViewController {
        guard let controller = navigationController.topViewController as? EditListViewController else {
            XCTFail("View should be edit list view");
            fatalError()
        }

        return controller
    }
}
