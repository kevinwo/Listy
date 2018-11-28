//
//  Mirror+LIST.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 10/6/18.
//

import Foundation

extension Mirror {
    public static func classNameForObject(_ object: AnyObject) -> String {
        let objectMirror = Mirror(reflecting: object)

        return String.init(describing: objectMirror.subjectType)
    }
}
