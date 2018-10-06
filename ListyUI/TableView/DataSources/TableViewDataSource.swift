//
//  TableViewDataSource.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit
import ListyKit

open class TableViewDataSource: SectionedDataSource {

    public typealias CellConfigurationBlock = (_ cell: UITableViewCell, _ object: Object) -> Void

    open weak var tableView: UITableView!
    open var cellConfigurationBlock: TableViewDataSource.CellConfigurationBlock
    var cellReuseIdentifier: String?

    public init(tableView: UITableView, cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock, cellReuseIdentifier: String? = nil, objects: [Object]? = nil) {
        self.tableView = tableView
        self.cellConfigurationBlock = cellConfigurationBlock
        self.cellReuseIdentifier = cellReuseIdentifier

        super.init(objects: objects)

        self.tableView.dataSource = self
    }

    public func object(at indexPath: IndexPath) -> Object {
        return self.sections[indexPath.section][indexPath.row]
    }
}

extension TableViewDataSource: UITableViewDataSource {
    open func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].count
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = self.sections[indexPath.section][indexPath.row]
        let reuseIdentifier = self.cellReuseIdentifier ?? Mirror.classNameForObject(object)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        self.cellConfigurationBlock(cell, object)

        return cell
    }
}
