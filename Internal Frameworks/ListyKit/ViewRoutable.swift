//
//  ViewRoutable.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/21/18.
//

#if os(watchOS)
import WatchKit
#endif

public protocol ViewRoutable: class {

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?)

    #if os(watchOS)
    func presentAlert(withTitle title: String?, message: String?, preferredStyle: WKAlertControllerStyle, actions: [WKAlertAction])
    func dismiss()
    #else
    func push(view: ViewRoutable, animated flag: Bool)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
    #endif
}
