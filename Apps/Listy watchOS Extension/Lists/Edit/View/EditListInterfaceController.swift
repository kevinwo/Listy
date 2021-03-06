//
//  EditInterfaceController.swift
//  Listy watchOS Extension
//
//  Created by Kevin Wolkober on 11/29/18.
//

import WatchKit
import Foundation
import ListyKit

protocol EditListInterfaceControllerDelegate: class {

    func didCancelWithController(_ controller: EditListInterfaceController)
    func controller(_ controller: EditListInterfaceController, didSaveList list: List)
}

class EditListInterfaceController: WKInterfaceController {

    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    @IBOutlet weak var saveButton: WKInterfaceButton!

    var presenter: EditListPresenterInput!
    var enteredTitle: String?
    weak var delegate: EditListInterfaceControllerDelegate!

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        let context = context as! [String: Any]
        let list = context["list"] as! List
        let delegate = context["delegate"] as! EditListInterfaceControllerDelegate

        self.delegate = delegate

        let database = Database.newInstance()
        let lists = Lists(database: database)

        let presenter = EditListPresenter()
        let router = EditListRouter()
        let interactor = EditListInteractor(list: list, lists: lists)

        self.presenter = presenter

        presenter.output = self
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter

        router.output = self
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // MARK: - Actions

    @IBAction func titleLabelTapped(_ sender: Any) {
        presentTextInputController(withSuggestions: nil, allowedInputMode: .allowEmoji) { (results) in
            if let results = results, results.count > 0 {
                if let title = results.first as? String {
                    self.enteredTitle = title
                    self.titleLabel.setText(title)
                }
            } else {
                // Nothing was selected.
            }
        }
    }

    @IBAction func saveButtonTapped() {
        self.presenter.save(title: self.enteredTitle)
    }
}

extension EditListInterfaceController: EditListPresenterOutput {}

extension EditListInterfaceController: EditListRouterOutput {

    public func finishWithCancel() {
        self.delegate.didCancelWithController(self)
    }

    public func finishWithSaving(_ list: List) {
        self.delegate.controller(self, didSaveList: list)
    }
}
