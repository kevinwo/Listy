//
//  ListsInteractor.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

public class ListsInteractor: ListsInteractorInput {

    // MARK: - Properties

    public weak var output: ListsInteractorOutput!
    internal var lists: Lists
    internal var tasks: Tasks

    public init(lists: Lists, tasks: Tasks) {
        self.lists = lists
        self.tasks = tasks
    }

    // MARK: - ListsInteractorInput

    public func fetchData() {
        let fetchedLists = self.lists.all()
        self.output.updateView(lists: fetchedLists)
    }

    public func newList() -> List {
        let list = List()

        #if os(macOS)
        list.title = "New list"
        #endif

        return list
    }

    public func deleteList(_ list: List, at indexPath: IndexPath) {
        let tasksInList = self.tasks.inList(list)

        do {
            for task in tasksInList {
                try self.tasks.delete(task)
            }

            try self.lists.delete(list)
            self.output.deleteRow(at: indexPath)
        } catch(let error) {
            self.output.failedToDeleteList(with: error as NSError)
        }
    }

    #if os(macOS)
    public func saveList(title: String?) {
        let list = List()
        list.title = title ?? ""

        do {
            try lists.add(list)
        } catch(let error) {
            self.output.failedToSaveList(with: error as NSError)
        }
    }
    #endif
}
