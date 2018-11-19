//
//  EditTaskRouterOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/19/18.
//

import ListyUI
import ListyKit

protocol EditTaskRouterOutput: ViewRoutable {
    func finishWithCancel()
    func finishWithSaving(_ task: Task)
}
