//
//  EditTaskPresenterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/26/18.
//

public protocol EditTaskPresenterInput: class {

    var router: EditTaskRouterInput! { get set }
    var interactor: EditTaskInteractorInput! { get set }

    func cancel()
    func save(title: String?)
}
