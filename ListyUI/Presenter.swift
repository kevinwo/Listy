//
//  Presenter.swift
//  ListyUI
//
//  Created by Kevin Wolkober on 10/6/18.
//

import UIKit

open class Presenter: NSObject {

    open func viewDidLoad() {
        fatalUnimplementedMethodError(#function, file: #file)
    }

    open func viewWillAppear() {
        fatalUnimplementedMethodError(#function, file: #file)
    }

    open func viewWillDisappear() {
        fatalUnimplementedMethodError(#function, file: #file)
    }

    open func viewDidAppear() {
        fatalUnimplementedMethodError(#function, file: #file)
    }

    open func showErrorAlert(_ error: Error) {
        fatalUnimplementedMethodError(#function, file: #file)
    }

    // MARK: - Private interface

    private func fatalUnimplementedMethodError(_ methodSignature: String, file: String) {
        fatalError("Please implement \(methodSignature) in \(file). Thank you")
    }
}
