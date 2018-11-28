//
//  ListsPresenterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

import UIKit
import ListyKit

protocol ListsPresenterInput: class {

    var output: ListsPresenterOutput! { get set }
    var router: ListsRouterInput! { get set }
    var interactor: ListsInteractorInput! { get set }

    func reloadData()
    func addList()
    func showTasks(for list: List)
    func deleteList(_ list: List, at indexPath: IndexPath)
}
