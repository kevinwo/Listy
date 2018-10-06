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

    public func fetch(by id: String) -> Task? {
        return self.database.object(ofType: Task.self, with: id) as? Task
    }

    public func add(_ task: Task) throws {
        try self.database.save(task)
    }
}
