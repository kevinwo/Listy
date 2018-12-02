//
//  ListsRouterOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/20/18.
//

public protocol ListsRouterOutput: ViewRoutable {

    func reloadData()
    #if os(macOS)
    func addRow(with list: List)
    #endif
}
