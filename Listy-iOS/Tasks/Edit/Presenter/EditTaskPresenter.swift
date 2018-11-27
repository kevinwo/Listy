//
//  EditTaskPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

final class EditTaskPresenter: EditTaskPresenterInput {

    // MARK: - Properties

    weak var view: EditTaskViewController!
    var router: EditTaskRouterInput!
    var interactor: EditTaskInteractorInput!

    // MARK: - EditTaskPresenterInput

    func cancel() {
        self.router.finishWithCancel()
    }

    func save(title: String?) {
        guard let title = title, !title.isEmpty else {
            let error = NSError(domain: "com.errordomain", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey: "Invalid title"])
            showErrorAlert(for: error)
            return
        }

        self.interactor.saveTask(title: title)
    }
}

extension EditTaskPresenter: EditTaskInteractorOutput {

    func finish(with task: Task) {
        self.router.finishWithSaving(task)
    }
}
