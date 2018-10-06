//
//  EditTaskPresenter.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import ListyUI
import ListyKit

class EditTaskPresenter: Presenter {

    weak var view: EditTaskViewController!
    var router: EditTaskRouter
    var interactor: EditTaskInteractor!

    init(view: EditTaskViewController) {
        self.view = view
        self.router = EditTaskRouter(view: view)

        super.init()

        self.interactor = EditTaskInteractor(output: self)
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

        self.interactor.saveTask(title: title)
    }

    // MARK: - Interactor output

    func finish(with task: Task) {
        self.view.delegate.controller(self.view, didSaveTask: task)
    }
}
