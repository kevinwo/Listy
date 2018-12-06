//
//  Lists.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/5/18.
//

import Foundation

public class Lists {

    // MARK: - Properties

    let database: Database

    // MARK: - Object lifecycle

    public init(database: Database) {
        self.database = database
    }

    // MARK: - Public interface

    public func all() -> [List] {
        if let lists = self.database.objects(ofType: List.self) as? [List] {
            return lists.sorted(by: { $0.title < $1.title })
        }

        return [List]()
    }

    public func fetch(by id: String) -> List? {
        return self.database.object(ofType: List.self, with: id) as? List
    }

    public func add(_ list: List) throws {
        guard !list.title.isEmpty else {
            throw NSError(domain: "com.errordomain", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey: "Invalid title"])
        }

        try self.database.save(list)
    }

    public func delete(_ list: List) throws {
        try self.database.delete(list)
    }
}
