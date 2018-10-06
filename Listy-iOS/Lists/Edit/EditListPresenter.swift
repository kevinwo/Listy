//
//  EditListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI

class EditListPresenter: Presenter {

    weak var view: EditListViewController!
    var router: EditListRouter
    var interactor: EditListInteractor!

    init(view: EditListViewController) {
        self.view = view
        self.router = EditListRouter(view: view)

        super.init()

        self.interactor = EditListInteractor(output: self)
    }

    // MARK: - Public interface

    override func viewDidLoad() {
        // Load cool stuff, generally with the interactor
    }

    override func showErrorAlert(_ error: Error) {
        // Present error info to the user
    }

    func cancel() {
        self.view.delegate.didCancelWithController(self.view)
    }

    func save() {
        guard let title = self.view.titleTextField.text, !title.isEmpty else {
            let error = NSError(domain: "com.errordomain", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey: "Invalid title"])
            showErrorAlert(error)
            return
        }

        self.interactor.saveList(title: title)
    }

    // MARK: - Interactor output

    func updateView() {
        // Update the view
    }
}
