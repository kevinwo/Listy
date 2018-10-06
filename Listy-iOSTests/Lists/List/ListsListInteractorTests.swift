//
//  ListsListInteractorTests.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import XCTest
@testable import Listy_iOS
@testable import ListyUI
@testable import ListyKit

class ListsListInteractorTests: XCTestCase {

    var sut: ListsListInteractor!
    var fakePresenter: FakeListsListPresenter!
    var controller: ListsListViewController!
    var cellConfigurationBlock: TableViewDataSource.CellConfigurationBlock!
    var lists: Lists!

    // MARK: - Test lifecycle

    override func setUp() {
        super.setUp()

        FileManager().clearTemporaryDirectory()

        let storyboard = UIStoryboard(name: "ListsList", bundle: nil)
        controller = (storyboard.instantiateViewController(withIdentifier: "ListsListViewController") as! ListsListViewController)

        fakePresenter = FakeListsListPresenter(view: controller)
        controller.presenter = fakePresenter

        sut = ListsListInteractor(output: fakePresenter)
        fakePresenter.interactor = sut

        lists = Lists(database: Database.newInstance(path: NSTemporaryDirectory()))
        sut.lists = lists

        cellConfigurationBlock = { (cell, object) in
            cell.textLabel!.text = object.id
        }

        _ = controller.view
    }

    override func tearDown() {
        sut = nil
        fakePresenter = nil
        controller = nil
        lists = nil
        cellConfigurationBlock = nil

        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - init(output:)

    func testInit() {
        // when
        let interactor = ListsListInteractor(output: fakePresenter)

        // then
        XCTAssertNotNil(interactor.output)
        XCTAssertNotNil(interactor.lists)
    }

    // MARK: - loadDataSource(for:cellConfigurationBlock:)

    func testLoadDataSource() {
        // given
        let tableView = controller.tableView!

        // when
        sut.loadDataSource(for: tableView, cellConfigurationBlock: cellConfigurationBlock)

        // then
        XCTAssertEqual(sut.dataSource.tableView, tableView)
    }

    // MARK: - fetchData()

    func testFetchData() {
        // given
        let list = List()
        list.title = "Cool List"
        try! lists.add(list)
        sut.loadDataSource(for: controller.tableView, cellConfigurationBlock: cellConfigurationBlock)

        // when
        sut.fetchData()

        // then
        XCTAssert(sut.dataSource.objects!.contains(list))
        XCTAssertTrue(fakePresenter.didCallUpdateView)
    }

    // MARK: - newList()

    func testNewList() {
        // when
        let list = sut.newList()

        // then
        XCTAssertNotNil(list)
        XCTAssertNil(list.title)
    }
}
