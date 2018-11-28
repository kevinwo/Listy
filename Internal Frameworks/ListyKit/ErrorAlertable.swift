//
//  ErrorAlertable.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/17/18.
//

import Foundation

public protocol ErrorAlertable {

    func showErrorAlert(for error: NSError)
}
