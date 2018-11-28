//
//  EditListRouterOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/28/18.
//

import ListyUI
import ListyKit

protocol EditListRouterOutput: ViewRoutable {
    func finishWithCancel()
    func finishWithSaving(_ list: List)
}
