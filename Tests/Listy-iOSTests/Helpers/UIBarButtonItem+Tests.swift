//
//  UIBarButtonItem+Tests.swift
//  Listy-iOSTests
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit

extension UIBarButtonItem {
    func tap() {
        UIApplication.shared.sendAction(self.action!, to: self.target, from: self, for: nil)
    }
}
