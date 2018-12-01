//
//  ErrorAlertable+LIST.swift
//  Listy macOS
//
//  Created by Kevin Wolkober on 12/1/18.
//

import AppKit
import ListyKit

extension ErrorAlertable where Self: ViewRoutable {

    func showErrorAlert(for error:
        NSError) {
        let alert = NSAlert(error: error)
        alert.alertStyle = .warning
        alert.addButton(withTitle: "OK")

        let _ = alert.runModal()
    }
}
