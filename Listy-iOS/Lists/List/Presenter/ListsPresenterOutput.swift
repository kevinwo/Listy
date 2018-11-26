//
//  ListsPresenterOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

import ListyKit

protocol ListsPresenterOutput: class {

    func updateView(lists: [List])
    func deleteRow(at indexPath: IndexPath)
}
