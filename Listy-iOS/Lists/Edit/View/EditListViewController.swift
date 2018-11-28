//
//  EditListViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyUI
import ListyKit

protocol EditListViewControllerDelegate: class {

    func didCancelWithController(_ controller: EditListViewController)
    func controller(_ controller: EditListViewController, didSaveList list: List)
}

class EditListViewController: UITableViewController {

    // MARK: - Properties

    @IBOutlet weak var cancelBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!

    var presenter: EditListPresenterInput!
    weak var delegate: EditListViewControllerDelegate!

    // MARK: - Button actions

    @IBAction func cancelBarButtonItemTapped(_ sender: Any) {
        self.presenter.cancel()
    }

    @IBAction func saveBarButtonItemTapped(_ sender: Any) {
        self.presenter.save(title: self.titleTextField.text)
    }
}

extension EditListViewController: EditListRouterOutput {
    func finishWithCancel() {
        self.delegate.didCancelWithController(self)
    }

    func finishWithSaving(_ list: List) {
        self.delegate.controller(self, didSaveList: list)
    }
}

extension EditListViewController: EditListPresenterOutput {}
