//
//  Task.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/5/18.
//

import Foundation

public class Task: Object {

    // MARK: - Properties

    public var title: String = ""
    public var listId: String!

    private enum CodingKeys: String, CodingKey {
        case title
        case listId
    }

    // MARK: - Object life cycle

    public override init() {
        super.init()
    }

    // MARK: - Decodable

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        listId = try values.decode(String.self, forKey: .listId)
    }

    // MARK: - Encodable

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(listId, forKey: .listId)
    }

    // MARK: - Public interface

    public override class func decode(_ data: Data, with decoder: PropertyListDecoder) throws -> Decodable {
        return try decoder.decode([Task].self, from: data)
    }
}
