//
//  Database.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/5/18.
//

import Foundation

public class Database {

    // MARK: - Properties

    public static let defaultPath: String = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!.path

    let path: String

    public init(path: String) {
        self.path = path
    }

    // MARK: - Public interface

    public static func newInstance(path: String? = nil) -> Database {
        return Database(path: path ?? Database.defaultPath)
    }

    public func objects(ofType type: Object.Type) -> [Object]? {
        let url = objectsUrl(for: type)

        if let data = try? Data(contentsOf: url) {
            let decoder = PropertyListDecoder()

            if let objects = try? type.decode(data, with: decoder) as? [Object] {
                return objects
            }
        }

        return nil
    }

    public func object(ofType type: Object.Type, with id: String) -> Object? {
        if let existingObjects = objects(ofType: type), let object = existingObjects.filter({ $0.id == id }).first {
            return object
        }

        return nil
    }

    public func save(_ object: Object) throws {
        let objectType = type(of: object)
        let url = objectsUrl(for: objectType)
        var existingObjects: [Object] = objects(ofType: objectType) ?? [Object]()

        if let index = existingObjects.index(of: object) {
            existingObjects[index] = object
        } else {
            object.dateCreated = Date()
            existingObjects.append(object)
        }

        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml

        let data = try encoder.encode(existingObjects)
        try data.write(to: url)
    }

    // MARK: - Private interface

    private func objectsUrl(for type: AnyClass) -> URL {
        let objectTypeString = String(describing: type)

        return URL(fileURLWithPath: self.path).appendingPathComponent("\(objectTypeString).plist")
    }
}
