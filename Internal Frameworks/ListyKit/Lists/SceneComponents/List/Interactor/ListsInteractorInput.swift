//
//  ListsInteractorInput.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 11/21/18.
//

public protocol ListsInteractorInput: class {

    func fetchData()
    func newList() -> List
    func deleteList(_ list: List, at indexPath: IndexPath)
}
