//
//  FileManager+Tests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import Foundation

extension FileManager {
    func clearTemporaryDirectory() {
        let tmpDirURL = FileManager.default.temporaryDirectory
        let tmpDirectory = try! contentsOfDirectory(atPath: tmpDirURL.path)

        tmpDirectory.forEach { file in
            let fileUrl = tmpDirURL.appendingPathComponent(file)
            try! removeItem(atPath: fileUrl.path)
        }
    }
}
