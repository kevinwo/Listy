//
//  Tasks.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/5/18.
//

import Foundation

public class Tasks: NSObject {

    // MARK: - Properties

    let database: Database

    // MARK: - Object lifecycle

    public init(database: Database) {
        self.database = database
    }

    // MARK: - Public interface

    public func all() -> [Task] {
        return self.database.objects(ofType: Task.self) as? [Task] ?? [Task]()
    }

    public func inList(_ list: List) -> [Task] {
        return all()
            .filter({ $0.listId == list.id })
            .sorted(by: { $0.dateCreated > $1.dateCreated })
    }

    public func fetch(by id: String) -> Task? {
        return self.database.object(ofType: Task.self, with: id) as? Task
    }

    public func add(_ task: Task) throws {
        guard !task.title.isEmpty else {
            throw NSError(domain: "com.errordomain", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey: "Invalid title"])
        }

        try self.database.save(task)
    }

    public func delete(_ task: Task) throws {
        try self.database.delete(task)
    }
}
