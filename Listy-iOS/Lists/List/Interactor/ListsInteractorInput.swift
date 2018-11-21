//
//  ListsInteractorInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

import ListyUI
import ListyKit

protocol ListsInteractorInput: class {

    func loadDataSource(for tableView: UITableView, cellConfigurationBlock: @escaping TableViewDataSource.CellConfigurationBlock)
    func fetchData()
    func newList() -> List
    func list(at indexPath: IndexPath) -> List
    func deleteList(at indexPath: IndexPath)
}
