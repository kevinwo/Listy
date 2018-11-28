//
//  EditTaskViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyKit

protocol EditTaskViewControllerDelegate: class {

    func didCancelWithController(_ controller: EditTaskViewController)
    func controller(_ controller: EditTaskViewController, didSaveTask task: Task)
}

class EditTaskViewController: UITableViewController {

    // MARK: - Properties

    @IBOutlet weak var cancelBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!

    var presenter: EditTaskPresenterInput!
    weak var delegate: EditTaskViewControllerDelegate!

    // MARK: - Button actions

    @IBAction func cancelBarButtonItemTapped(_ sender: Any) {
        self.presenter.cancel()
    }

    @IBAction func saveBarButtonItemTapped(_ sender: Any) {
        self.presenter.save(title: self.titleTextField.text)
    }
}

extension EditTaskViewController: EditTaskRouterOutput {
    func finishWithCancel() {
        self.delegate.didCancelWithController(self)
    }

    func finishWithSaving(_ task: Task) {
        self.delegate.controller(self, didSaveTask: task)
    }
}

extension EditTaskViewController: EditTaskPresenterOutput {}
