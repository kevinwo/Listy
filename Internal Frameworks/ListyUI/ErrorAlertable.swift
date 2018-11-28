//
//  ErrorAlertable.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/17/18.
//

import UIKit

public protocol ErrorAlertable {

    func showErrorAlert(for error: NSError)
}

extension ErrorAlertable where Self: ViewRoutable {

    public func showErrorAlert(for error:
        NSError) {
        let controller = UIAlertController(title: error.localizedFailureReason ?? error.localizedDescription, message: error.localizedRecoverySuggestion, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        controller.addAction(cancelAction)

        self.present(view: controller, animated: true, completion: nil)
    }
}
