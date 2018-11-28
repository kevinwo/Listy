//
//  EditListPresenterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/27/18.
//

public protocol EditListPresenterInput: class {

    var output: EditListPresenterOutput! { get set }
    var router: EditListRouterInput! { get set }
    var interactor: EditListInteractorInput! { get set }

    func cancel()
    func save(title: String?)
}
