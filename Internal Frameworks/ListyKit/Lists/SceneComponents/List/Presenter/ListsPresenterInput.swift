//
//  ListsPresenterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/21/18.
//

public protocol ListsPresenterInput: class {

    var output: ListsPresenterOutput! { get set }
    var router: ListsRouterInput! { get set }
    var interactor: ListsInteractorInput! { get set }

    func reloadData()
    func addList()
    func showTasks(for list: List)
    func confirmDeleteList(_ list: List, confirmAction: @escaping () -> Void)
    func deleteList(_ list: List, at indexPath: IndexPath)

    #if os(macOS)
    func save(title: String?)
    #endif
}
