//
//  ListsInteractorOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

import ListyUI
import ListyKit

protocol ListsInteractorOutput: class {

    func updateView(lists: [List])
    func deleteRow(at indexPath: IndexPath)
    func failedToDeleteList(with error: NSError)
}
