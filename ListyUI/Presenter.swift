//
//  Presenter.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/6/18.
//

import Foundation

public protocol Presenter {

    associatedtype T: UIViewController
    var view: T! { get set }

    init(view: T)
    func viewDidLoad()
    func showErrorAlert(for error: Error)
}

extension Presenter {

    public func viewDidLoad() {
        fatalUnimplementedMethodError(#function, file: #file)
    }

    public func showErrorAlert(for error:
        Error) {
        // @TODO: Default implementation for showing error alert
    }

    // MARK: - Private interface

    private func fatalUnimplementedMethodError(_ methodSignature: String, file: String) {
        fatalError("Please implement \(methodSignature) in \(file). Thank you")
    }
}
