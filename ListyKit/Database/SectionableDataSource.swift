//
//  SectionableDataSource.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/6/18.
//

import Foundation

public protocol SectionableDataSource {

    var sections: [[Object]] { get set }
}

extension SectionableDataSource {

    public var objects: [Object] {
        get {
            let joined = self.sections
                .compactMap({ $0 })
                .joined()
            return Array(joined)
        }
    }
}
