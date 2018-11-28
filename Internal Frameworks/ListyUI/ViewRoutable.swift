//
//  ViewRoutable.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/21/18.
//

import ListyKit

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

extension ErrorAlertable where Self: ViewRoutable {

    public func showErrorAlert(for error:
        NSError) {
        let controller = UIAlertController(title: error.localizedFailureReason ?? error.localizedDescription, message: error.localizedRecoverySuggestion, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        controller.addAction(cancelAction)

        self.present(view: controller, animated: true, completion: nil)
    }
}
