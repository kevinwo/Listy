//
//  EditListRouterInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/27/18.
//

import ListyKit

protocol EditListRouterInput: class {

    func finishWithCancel()
    func finishWithSaving(_ list: List)
}
