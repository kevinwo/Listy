//
//  ListsInteractorOutput.swift
//  ListyKit
//
//  Created by Kevin Wolkober on 11/21/18.
//

public protocol ListsInteractorOutput: class {

    func updateView(lists: [List])
    func deleteRow(at indexPath: IndexPath)
    func failedToDeleteList(with error: NSError)

    #if os(macOS)
    func failedToSaveList(with error: NSError)
    #endif
}
