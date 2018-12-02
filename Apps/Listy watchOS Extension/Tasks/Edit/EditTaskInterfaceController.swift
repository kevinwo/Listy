//
//  EditTaskInterfaceController.swift
//  Listy watchOS Extension
//
//  Created by Kevin Wolkober on 12/2/18.
//

import WatchKit
import Foundation
import ListyKit

protocol EditTaskInterfaceControllerDelegate: class {

    func didCancelWithController(_ controller: EditListInterfaceController)
    func controller(_ controller: EditListInterfaceController, didSaveList list: List)
}

class EditTaskInterfaceController: WKInterfaceController {

    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    @IBOutlet weak var saveButton: WKInterfaceButton!
}
