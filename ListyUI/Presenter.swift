//
//  Presenter.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/6/18.
//

import Foundation

public protocol Presenter: ErrorAlertable {

    associatedtype View: UIViewController
    var view: View! { get set }

    init(view: View)
    func viewDidLoad()
}

extension Presenter {

    public func viewDidLoad() {
        fatalUnimplementedMethodError(#function, file: #file)
    }

    // MARK: - Private interface

    private func fatalUnimplementedMethodError(_ methodSignature: String, file: String) {
        fatalError("Please implement \(methodSignature) in \(file). Thank you")
    }
}
