//
//  Object.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/5/18.
//

import UIKit

public class Object: Codable {

    // MARK: - Properties

    public let id: String

    private enum CodingKeys: String, CodingKey {
        case id
    }

    // MARK: - Object lifecycle

    public init() {
        self.id = UUID().uuidString
    }

    // MARK: - Decodable

    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
    }

    // MARK: - Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
    }
}
