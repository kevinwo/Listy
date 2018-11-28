//
//  ViewRoutable+LIST.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/28/18.
//

import ListyKit

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
