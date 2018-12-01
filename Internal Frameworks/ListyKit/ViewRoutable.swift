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

    #if os(watchOS)
    func presentController(withName name: String, context: Any?)
    func presentAlert(withTitle title: String?, message: String?, preferredStyle: WKAlertControllerStyle, actions: [WKAlertAction])
    func dismiss()
    #elseif os(iOS) || os(tvOS)
    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?)
    func push(view: ViewRoutable, animated flag: Bool)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
    #endif
}
