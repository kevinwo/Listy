//
//  TableViewDataSource.swift
//  Listy macOS
//
//  Created by Kevin Wolkober on 12/1/18.
//

import Cocoa
import ListyKit

class TableViewDataSource: NSObject {

    var objects: [Object] = [Object]()

    func object(for row: Int) -> Object {
        return self.objects[row]
    }
}

extension TableViewDataSource: NSTableViewDataSource {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.objects.count
    }
}
