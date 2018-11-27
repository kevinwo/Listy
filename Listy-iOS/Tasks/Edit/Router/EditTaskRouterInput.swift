//
//  EditTaskRouterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 10/22/18.
//

import ListyUI
import ListyKit

protocol EditTaskRouterInput {

    var view: EditTaskRouterOutput! { get }

    func finishWithCancel()
    func finishWithSaving(_ task: Task)
}
