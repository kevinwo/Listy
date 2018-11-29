//
//  ErrorAlertable+LIST.swift
//  Listy watchOS Extension
//
//  Created by Kevin Wolkober on 11/29/18.
//

import WatchKit
import ListyKit

extension ErrorAlertable where Self: ViewRoutable {

    public func showErrorAlert(for error:
        NSError) {
        let action = WKAlertAction(title: "OK", style: .cancel) {}

        presentAlert(
            withTitle: error.localizedFailureReason ?? error.localizedDescription,
            message: error.localizedRecoverySuggestion,
            preferredStyle:.actionSheet,
            actions: [action]
        )
    }
}
