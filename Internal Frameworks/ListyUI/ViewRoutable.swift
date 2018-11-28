//
//  ViewRoutable.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/21/18.
//

import Foundation

public protocol ViewRoutable: class {

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?)
    func push(view: ViewRoutable, animated flag: Bool)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
}

extension ViewRoutable where Self: UIViewController {

    public func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?) {
        let view = view as! UIViewController
        present(view, animated: flag, completion: completion)
    }

    public func push(view: ViewRoutable, animated flag: Bool) {
        let view = view as! UIViewController
        self.navigationController?.pushViewController(view, animated: true)
    }
}

extension UIViewController: ViewRoutable {}
