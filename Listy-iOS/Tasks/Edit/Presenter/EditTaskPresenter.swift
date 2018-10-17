//
//  EditTaskPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class EditTaskPresenter: Presenter, EditTaskInteractorOutput {

    typealias View = EditTaskViewController

    // MARK: - Properties

    weak var view: EditTaskViewController!
    var router: EditTaskRouter
    lazy var interactor: EditTaskInteractorInput = {
        return EditTaskInteractor(output: self)
    }()

    // MARK: - Object lifecycle

    required init(view: EditTaskViewController) {
        self.view = view
        self.router = EditTaskRouter(view: view)
    }

    // MARK: - Public interface

    func viewDidLoad() {
        self.interactor.loadTask(self.view.task)
    }

    func cancel() {
        self.view.delegate.didCancelWithController(self.view)
    }

    func save() {
        guard let title = self.view.titleTextField.text, !title.isEmpty else {
            let error = NSError(domain: "com.errordomain", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey: "Invalid title"])
            showErrorAlert(for: error)
            return
        }

        self.interactor.saveTask(title: title)
    }

    // MARK: - EditTaskInteractorOutput

    func finish(with task: Task) {
        self.view.delegate.controller(self.view, didSaveTask: task)
    }
}
