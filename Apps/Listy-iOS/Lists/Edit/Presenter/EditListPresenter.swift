//
//  EditListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class EditListPresenter: EditListPresenterInput {

    // MARK: - Properties

    weak var output: EditListPresenterOutput!
    var router: EditListRouterInput!
    var interactor: EditListInteractorInput!

    // MARK: - EditListPresenterInput

    func cancel() {
        self.router.finishWithCancel()
    }

    func save(title: String?) {
        guard let title = title, !title.isEmpty else {
            let error = NSError(domain: "com.errordomain", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey: "Invalid title"])
            self.output.showErrorAlert(for: error)
            return
        }

        self.interactor.saveList(title: title)
    }
}

extension EditListPresenter: EditListInteractorOutput {

    func finish(with list: List) {
        self.router.finishWithSaving(list)
    }

    func failedToSaveList(with error: NSError) {
        self.output.showErrorAlert(for: error)
    }
}
