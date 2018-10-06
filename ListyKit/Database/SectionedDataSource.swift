//
//  SectionedDataSource.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/6/18.
//

import Foundation

open class SectionedDataSource: NSObject {

    var sections: [[Object]]
    open var objects: [Object]? {
        get {
            let joined = self.sections
                .compactMap({ $0 })
                .joined()
            return Array(joined) as [Object]?
        }
        set(value) {
            self.sections = [value!]
        }
    }

    init(objects: [Object]? = nil) {
        self.sections = [[Object]]()

        if let objects = objects {
            self.sections.append(objects)
        }
    }
}
