//
//  EditTaskPresenterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/26/18.
//

import UIKit

protocol EditTaskPresenterInput: class {

    func viewDidLoad()
    func cancel()
    func save(title: String?)
}
