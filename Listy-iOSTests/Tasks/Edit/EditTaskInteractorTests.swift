//
//  EditTaskInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyKit

class EditTaskInteractorTests: XCTestCase {

    var sut: EditTaskInteractor!
    var fakePresenter: FakeEditTaskPresenter!
    var controller: EditTaskViewController!
    var tasks: Tasks!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "EditTask", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController)

        fakePresenter = FakeEditTaskPresenter(view: controller)
        controller.presenter = fakePresenter

        sut = EditTaskInteractor(output: fakePresenter)
        fakePresenter.interactor = sut

        tasks = Tasks(database: Database.newInstance(path: NSTemporaryDirectory()))
        sut.tasks = tasks

        _ = controller.view
    }

    override func tearDown(){
        sut = nil
        fakePresenter = nil
        controller = nil
        tasks = nil

        super.tearDown()
    }

    // MARK: - Tests

    func testInit() {
        // when
        let interactor = EditTaskInteractor(output: fakePresenter)

        // then
        XCTAssertEqual(interactor.output, fakePresenter)
    }

    // MARK: - saveList(title:)
    
    func testSaveTask_WhenSuccess() {
        // given
        let title = "Important task"
        let allTasksBeforeSave = tasks.all()
        XCTAssertNil(allTasksBeforeSave.filter({ $0.title == title }).first)

        // when
        sut.saveTask(title: title)

        // then
        let allTasksAfterSave = tasks.all()
        XCTAssertNotNil(allTasksAfterSave.filter({ $0.title == title }).first)
        XCTAssertTrue(fakePresenter.didCallFinish)
    }
}
