//
//  EditListInteractorOutput.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/27/18.
//

import Foundation
@testable import ListyKit

protocol EditListInteractorOutput: class {

    func finish(with list: List)
    func failedToSaveList(with error: NSError)
}
