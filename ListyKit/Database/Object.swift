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

    private enum CodingKeys: String, CodingKey {
        case id
        case dateCreated
    }

    // MARK: - Object lifecycle

    public init() {
        self.id = UUID().uuidString
    }

    // MARK: - Decodable

    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        dateCreated = try values.decodeIfPresent(Date.self, forKey: .dateCreated)
    }

    // MARK: - Encodable

    open func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(dateCreated, forKey: .dateCreated)
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
