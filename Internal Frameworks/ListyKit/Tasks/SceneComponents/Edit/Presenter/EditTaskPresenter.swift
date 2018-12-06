//
//  EditTaskPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

public final class EditTaskPresenter: EditTaskPresenterInput {

    // MARK: - Properties

    public weak var output: EditTaskPresenterOutput!
    public var router: EditTaskRouterInput!
    public var interactor: EditTaskInteractorInput!

    public init() {}

    // MARK: - EditTaskPresenterInput

    public func cancel() {
        self.router.finishWithCancel()
    }

    public func save(title: String?) {
        self.interactor.saveTask(title: title)
    }
}

extension EditTaskPresenter: EditTaskInteractorOutput {

    public func finish(with task: Task) {
        self.router.finishWithSaving(task)
    }

    public func failedToSaveTask(with error: NSError) {
        self.output.showErrorAlert(for: error)
    }
}
