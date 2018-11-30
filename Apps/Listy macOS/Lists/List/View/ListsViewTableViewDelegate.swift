//
//  ListsViewTableViewDelegate.swift
//  Listy macOS
//
//  Created by Kevin Wolkober on 11/30/18.
//

import Cocoa

class ListsViewTableViewDelegate: NSObject {
}

extension ListsViewTableViewDelegate: NSTableViewDelegate {

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let identifier = tableColumn?.identifier, let cellView = tableView.makeView(withIdentifier: identifier, owner: self) as? NSTableCellView {
            cellView.textField?.stringValue = "Cool List"

            return cellView
        }

        return nil
    }
}
