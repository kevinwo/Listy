//
//  EditTaskViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit
import ListyKit

protocol EditTaskViewControllerDelegate: NSObjectProtocol {
    func didCancelWithController(_ controller: EditTaskViewController)
    func controller(_ controller: EditTaskViewController, didSaveTask task: Task)
}

class EditTaskViewController: UITableViewController {

    // MARK: - Properties

    @IBOutlet weak var cancelBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!

    var presenter: EditTaskPresenter!
    var task: Task!
    weak var delegate: EditTaskViewControllerDelegate!

    // MARK: - Object lifecycle

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)

        self.presenter = EditTaskPresenter(view: self)
    }

    // MARK: - Button actions

    @IBAction func cancelBarButtonItemTapped(_ sender: Any) {
        self.presenter.cancel()
    }

    @IBAction func saveBarButtonItemTapped(_ sender: Any) {
        self.presenter.save()
    }
}
