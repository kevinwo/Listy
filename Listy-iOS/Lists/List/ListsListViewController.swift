//
//  ListsListViewController.swift
//  Listy
//
//  Created by Kevin Wolkober on 10/6/18.
//  Copyright (c) 2018 Kevin Wolkober. All rights reserved.
//

import UIKit

class ListsListViewController: UITableViewController {

    var presenter: ListsListPresenter!

    // MARK: Object lifecycle

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)

        self.presenter = ListsListPresenter(view: self)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.viewDidLoad()
    }
}
