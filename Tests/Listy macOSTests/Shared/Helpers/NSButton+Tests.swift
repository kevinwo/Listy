//
//  NSButton+Tests.swift
//  Listy macOSTests
//
//  Created by Kevin Wolkober on 12/2/18.
//

import Cocoa

extension NSButton {

    func tap() {
        self.sendAction(self.action!, to: self.target)
    }
}
