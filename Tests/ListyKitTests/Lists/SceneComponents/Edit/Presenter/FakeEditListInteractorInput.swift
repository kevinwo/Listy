//
//  FakeEditListInteractor.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
@testable import ListyKit

class FakeEditListInteractorInput: EditListInteractorInput {

    var didCallSaveList: Bool = false
    let lists: Lists
    var list: List

    var saveListTitle: String?

    required init(list: List, lists: Lists) {
        self.list = list
        self.lists = lists
    }

    func saveList(title: String?) {
        self.didCallSaveList = true
        self.saveListTitle = title
    }
}
