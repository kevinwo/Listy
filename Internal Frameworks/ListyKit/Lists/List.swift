//
//  List.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/5/18.
//

import Foundation

public class List: Object {

    // MARK: - Properties

    public var title: String!

    private enum CodingKeys: String, CodingKey {
        case title
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
    }

    // MARK: - Encodable

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
    }

    // MARK: - Public interface

    public override class func decode(_ data: Data, with decoder: PropertyListDecoder) throws -> Decodable {
        return try decoder.decode([List].self, from: data)
    }
}
