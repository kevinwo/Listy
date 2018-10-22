//
//  RoutableView.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/21/18.
//

import Foundation

public protocol ViewRoutable: class {

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
}

extension ViewRoutable where Self: UIViewController {

    public func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {
        let view = view as! UIViewController
        present(view, animated: flag, completion: completion)
    }
}

extension UIViewController: ViewRoutable {}
