//
//  FakeListsInteractorInput.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import ListyKit

class FakeListsInteractorInput: ListsInteractorInput {

    weak var output: ListsInteractorOutput!
    var lists: Lists!
    var tasks: Tasks!

    var didCallFetchData: Bool = false
    lazy var testList: List = {
        let list = List()
        list.title = "Cool List"
        return list
    }()
    var didCallDeleteList: Bool = false
    var deletedList: List?
    var deletedListIndexPath: IndexPath?

    init(lists: Lists, tasks: Tasks) {
        self.lists = lists
        self.tasks = tasks
    }

    func fetchData() {
        self.didCallFetchData = true
    }

    func newList() -> List {
        return List()
    }

    func deleteList(_ list: List, at indexPath: IndexPath) {
        self.didCallDeleteList = true
        self.deletedList = list
        self.deletedListIndexPath = indexPath
    }
}
