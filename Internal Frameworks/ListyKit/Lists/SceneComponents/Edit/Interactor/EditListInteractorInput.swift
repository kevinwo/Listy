//
//  EditListInteractorInput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/27/18.
//

public protocol EditListInteractorInput: class {

    init(list: List, lists: Lists)
    func saveList(title: String?)
}
