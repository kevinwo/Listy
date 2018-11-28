//
//  EditListRouterOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/28/18.
//

public protocol EditListRouterOutput: ViewRoutable {

    func finishWithCancel()
    func finishWithSaving(_ list: List)
}
