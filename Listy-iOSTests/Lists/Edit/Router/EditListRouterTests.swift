//
//  EditListRouterTests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 11/27/18.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class EditListRouterTests: XCTestCase {

    var fakeDelegate: FakeEditListViewControllerDelegate!
    var view: EditListViewController!
    var sut: EditListRouter!

    override func setUp() {
        let storyboard = UIStoryboard(name: "EditList", bundle: nil)
        let navigationController = (storyboard.instantiateInitialViewController() as! UINavigationController)
        view = (navigationController.topViewController as! EditListViewController)
        fakeDelegate = FakeEditListViewControllerDelegate()
        view.delegate = fakeDelegate

        sut = EditListRouter(view: view)
    }

    override func tearDown() {
        sut = nil
        view = nil
    }

    // MARK: - Tests

    // MARK: - Scene

    func testSceneView() {
        // given
        let (list, delegate) = sceneInitArguments()

        // when
        let navigationController = EditListRouter.scene(list: list, delegate: delegate)

        // then
        let controller = assertSceneView(navigationController)

        XCTAssert(controller.presenter is EditListPresenter)
        XCTAssert(controller.delegate is FakeEditListViewControllerDelegate)
    }

    func testScenePresenter() {
        // given
        let (list, delegate) = sceneInitArguments()

        // when
        let navigationController = EditListRouter.scene(list: list, delegate: delegate)

        // then
        let controller = assertSceneView(navigationController)
        
        guard controller.presenter != nil else {
            XCTFail("Presenter should not be nil"); return
        }
        guard let presenter = controller.presenter as? EditListPresenter else {
            XCTFail("Presenter should be Edit list presenter"); return
        }
        
        XCTAssert(presenter.router is EditListRouter)
        XCTAssert(presenter.interactor is EditListInteractor)
    }
    
    func testSceneRouter() {
        // given
        let (list, delegate) = sceneInitArguments()

        // when
        let navigationController = EditListRouter.scene(list: list, delegate: delegate)

        // then
        let controller = assertSceneView(navigationController)

        guard let router = controller.presenter.router as? EditListRouter else {
            XCTFail("Edit list router should be present"); return
        }
        guard let routerOutput = router.view as? EditListViewController else {
            XCTFail("Router output should be present"); return
        }

        XCTAssertEqual(routerOutput, controller)
    }
    
    func testSceneInteractor() {
        let (list, delegate) = sceneInitArguments()

        // when
        let navigationController = EditListRouter.scene(list: list, delegate: delegate)

        // then
        let controller = assertSceneView(navigationController)

        guard let interactor = controller.presenter.interactor as? EditListInteractor else {
            XCTFail("Edit list interactor should be present")
            return
        }

        XCTAssert(interactor.output is EditListPresenter)
    }

    // MARK: - finishWithSaving()

    func testFinishWithSaving() {
        // given
        let list = List()

        // when
        sut.finishWithSaving(list)

        // then
        XCTAssertTrue(fakeDelegate.didCallControllerDidSaveList);
        XCTAssertEqual(fakeDelegate.didSaveListController, view)
        XCTAssertEqual(fakeDelegate.savedList, list)
    }

    // MARK: - Private interface

    func sceneInitArguments() -> (List, FakeEditListViewControllerDelegate) {
        let lists = List()
        let delegate = FakeEditListViewControllerDelegate()

        return (lists, delegate)
    }

    func assertSceneView(_ navigationController: UINavigationController) -> EditListViewController {
        guard let controller = navigationController.topViewController as? EditListViewController else {
            XCTFail("View should be edit list view");
            fatalError()
        }

        return controller
    }
}
