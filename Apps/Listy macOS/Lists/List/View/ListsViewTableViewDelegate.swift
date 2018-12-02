//
//  ListsViewTableViewDelegate.swift
//  Listy macOS
//
//  Created by Kevin Wolkober on 11/30/18.
//

import Cocoa
import ListyKit

class ListsViewTableViewDelegate: NSObject {

    typealias CellConfigurationBlock = (_ cellView: NSTableCellView, _ row: Int) -> Void

    open var cellConfigurationBlock: ListsViewTableViewDelegate.CellConfigurationBlock?
}

extension ListsViewTableViewDelegate: NSTableViewDelegate {

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let identifier = tableColumn?.identifier, let cellView = tableView.makeView(withIdentifier: identifier, owner: self) as? NSTableCellView {
            self.cellConfigurationBlock?(cellView, row)

            return cellView
        }

        return nil
    }
}
