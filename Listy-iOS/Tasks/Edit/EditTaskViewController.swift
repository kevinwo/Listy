//
//  EditTaskViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit

class EditTaskViewController: UITableViewController {

    var presenter: EditTaskPresenter! 

    // MARK: Object lifecycle

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)

        self.presenter = EditTaskPresenter(view: self)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.viewDidLoad()
    }
}
