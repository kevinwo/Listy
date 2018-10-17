//
//  ErrorAlertable.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/17/18.
//

import UIKit

public protocol ErrorAlertable {

    func showErrorAlert(for error: Error)
}

extension ErrorAlertable {

    public func showErrorAlert(for error:
        Error) {
        // @TODO: Default implementation for showing error alert
    }
}
