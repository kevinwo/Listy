//
//  FakeListsPresenterInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import ListyKit

final class FakeListsPresenterInput: ListsPresenterInput {

    weak var output: ListsPresenterOutput!
    var router: ListsRouterInput!
    var interactor: ListsInteractorInput!

    var didCallReloadData: Bool = false
    var didCallAddList: Bool = false
    var didCallShowTasks: Bool = false
    var didDeleteList: Bool = false

    var deletedList: List?
    var deletedListIndexPath: IndexPath?
    var listWithTasksToShow: List?

    func reloadData() {
        self.didCallReloadData = true
    }

    func addList() {
        self.didCallAddList = true
    }

    func showTasks(for list: List) {
        self.didCallShowTasks = true
        self.listWithTasksToShow =  list
    }

    func deleteList(_ list: List, at indexPath: IndexPath) {
        self.didDeleteList = true
        self.deletedList = list
        self.deletedListIndexPath = indexPath
    }
}
