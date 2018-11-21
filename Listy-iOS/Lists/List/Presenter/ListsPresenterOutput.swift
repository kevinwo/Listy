//
//  ListsPresenterOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

import UIKit

protocol ListsPresenterOutput: class {

    func updateView()
    func deleteRow(at indexPath: IndexPath)
}
