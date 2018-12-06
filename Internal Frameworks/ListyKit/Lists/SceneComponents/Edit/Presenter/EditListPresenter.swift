//
//  EditListPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

public final class EditListPresenter: EditListPresenterInput {

    // MARK: - Properties

    public weak var output: EditListPresenterOutput!
    public var router: EditListRouterInput!
    public var interactor: EditListInteractorInput!

    public init() {}

    // MARK: - EditListPresenterInput

    public func cancel() {
        self.router.finishWithCancel()
    }

    public func save(title: String?) {
        self.interactor.saveList(title: title)
    }
}

extension EditListPresenter: EditListInteractorOutput {

    public func finish(with list: List) {
        self.router.finishWithSaving(list)
    }

    public func failedToSaveList(with error: NSError) {
        self.output.showErrorAlert(for: error)
    }
}
