//
//  Router.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit

public protocol Router: NSObjectProtocol {

    associatedtype T: UIViewController

    var view: T! { get set }
    init(view: T)
}
