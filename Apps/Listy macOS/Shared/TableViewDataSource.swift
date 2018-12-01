//
//  TableViewDataSource.swift
//  Listy macOS
//
//  Created by Kevin Wolkober on 12/1/18.
//

import Cocoa

class TableViewDataSource: NSObject {
}

extension TableViewDataSource: NSTableViewDataSource {

    func numberOfRows(in tableView: NSTableView) -> Int {
        return 3
    }
}
