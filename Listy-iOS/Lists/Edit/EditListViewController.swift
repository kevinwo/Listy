//
//  EditListViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit

class EditListViewController: UITableViewController {

    var presenter: EditListPresenter! 

    // MARK: Object lifecycle

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)

        self.presenter = EditListPresenter(view: self)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.viewDidLoad()
    }
}
