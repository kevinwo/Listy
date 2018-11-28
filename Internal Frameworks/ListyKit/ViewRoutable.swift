//
//  ViewRoutable.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/21/18.
//

public protocol ViewRoutable: class {

    func present(view: ViewRoutable, animated flag: Bool, completion: (() -> Void)?)
    func push(view: ViewRoutable, animated flag: Bool)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
}
