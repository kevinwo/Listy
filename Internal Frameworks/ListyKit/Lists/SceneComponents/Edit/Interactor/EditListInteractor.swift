//
//  EditListInteractor.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

public class EditListInteractor: EditListInteractorInput {

    // MARK: - Properties

    public weak var output: EditListInteractorOutput!
    internal let lists: Lists
    internal var list: List

    // MARK: - EditListInteractorInput

    public required init(list: List, lists: Lists) {
        self.list = list
        self.lists = lists
    }

    public func saveList(title: String?) {
        list.title = title ?? ""

        do {
            try lists.add(list)
            self.output.finish(with: list)
        } catch(let error) {
            self.output.failedToSaveList(with: error as NSError)
        }
    }
}
