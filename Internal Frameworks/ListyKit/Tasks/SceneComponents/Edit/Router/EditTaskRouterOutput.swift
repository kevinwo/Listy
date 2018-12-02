//
//  EditTaskRouterOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/19/18.
//

public protocol EditTaskRouterOutput: ViewRoutable {
    func finishWithCancel()
    func finishWithSaving(_ task: Task)
}
