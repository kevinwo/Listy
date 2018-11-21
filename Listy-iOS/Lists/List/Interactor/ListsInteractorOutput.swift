//
//  ListsInteractorOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

import ListyUI

protocol ListsInteractorOutput: class, ErrorAlertable {

    func updateView()
    func deleteRow(at indexPath: IndexPath)
}
