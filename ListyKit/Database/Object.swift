//
//  Object.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/5/18.
//

import Foundation

open class Object: Codable {

    // MARK: - Properties

    public let id: String
    public var dateCreated: Date!

    // MARK: - Object lifecycle

    public init() {
        self.id = UUID().uuidString
    }

    // MARK: - Public interface

    open class func decode(_ data: Data, with decoder: PropertyListDecoder) throws -> Decodable {
        return try decoder.decode([Object].self, from: data)
    }
}

extension Object: Equatable {
    public static func == (lhs: Object, rhs: Object) -> Bool {
        return lhs.id == rhs.id
    }
}
