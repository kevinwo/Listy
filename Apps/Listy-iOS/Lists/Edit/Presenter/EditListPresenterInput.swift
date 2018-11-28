//
//  EditListPresenterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/27/18.
//

import ListyKit

protocol EditListPresenterInput: class {

    var router: EditListRouterInput! { get set }
    var interactor: EditListInteractorInput! { get set }

    func cancel()
    func save(title: String?)
}
