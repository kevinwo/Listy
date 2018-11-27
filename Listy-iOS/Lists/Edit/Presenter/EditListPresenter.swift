//
//  EditListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class EditListPresenter {

    weak var view: EditListViewController!
    var router: EditListRouterInput!
    lazy var interactor: EditListInteractor = {
        return EditListInteractor(output: self)
    }()

    init(view: EditListViewController) {
        self.view = view
        self.router = EditListRouter(view: view)
    }

    // MARK: - Public interface

    func cancel() {
        self.view.delegate.didCancelWithController(self.view)
    }

    func save() {
        guard let title = self.view.titleTextField.text, !title.isEmpty else {
            let error = NSError(domain: "com.errordomain", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey: "Invalid title"])
            self.view.showErrorAlert(for: error)
            return
        }

        self.interactor.saveList(title: title)
    }

    // MARK: - Interactor output

    func finish(with list: List) {
        self.router.finishWithSaving(list)
    }

    func failedToSaveList(with error: NSError) {
        self.view.showErrorAlert(for: error)
    }
}
