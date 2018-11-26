//
//  ListsInteractorOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

import ListyUI
import ListyKit

protocol ListsInteractorOutput: class, ErrorAlertable {

    func updateView(lists: [List])
    func deleteRow(at indexPath: IndexPath)
}
