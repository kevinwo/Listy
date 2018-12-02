//
//  EditTaskViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyKit

public protocol EditTaskViewControllerDelegate: class {

    func didCancelWithController(_ controller: EditTaskViewController)
    func controller(_ controller: EditTaskViewController, didSaveTask task: Task)
}

public class EditTaskViewController: UITableViewController {

    // MARK: - Properties

    @IBOutlet weak var cancelBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!

    public var presenter: EditTaskPresenterInput!
    public weak var delegate: EditTaskViewControllerDelegate!

    // MARK: - UITableViewDelegate

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            self.titleTextField.becomeFirstResponder()
        }
    }

    // MARK: - Button actions

    @IBAction func cancelBarButtonItemTapped(_ sender: Any) {
        self.presenter.cancel()
    }

    @IBAction func saveBarButtonItemTapped(_ sender: Any) {
        self.presenter.save(title: self.titleTextField.text)
    }
}

extension EditTaskViewController: EditTaskRouterOutput {

    public func finishWithCancel() {
        self.delegate.didCancelWithController(self)
    }

    public func finishWithSaving(_ task: Task) {
        self.delegate.controller(self, didSaveTask: task)
    }
}

extension EditTaskViewController: EditTaskPresenterOutput {}
