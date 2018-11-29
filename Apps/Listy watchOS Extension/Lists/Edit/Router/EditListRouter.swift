//
//  EditListRouter.swift
//  Listy watchOS Extension
//
//  Created by Kevin Wolkober on 11/29/18.
//

import ListyKit

class EditListRouter: EditListRouterInput {

    // MARK: - Properties

    weak var output: EditListRouterOutput!

    // MARK: - EditListRouterInput

    func finishWithCancel() {
        self.output.finishWithCancel()
    }

    func finishWithSaving(_ list: List) {
        self.output.finishWithSaving(list)
    }
}
