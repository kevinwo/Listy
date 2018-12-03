//
//  ListsViewTableViewDelegate.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/26/18.
//

class ListsViewTableViewDelegate: NSObject {

    var didSelectRowHandler: ((IndexPath) -> Void)?
    var deleteRowHandler: ((IndexPath) -> Void)?

    #if os(tvOS)
    var focusedIndexPath: IndexPath?
    #endif
}

extension ListsViewTableViewDelegate: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectRowHandler?(indexPath)
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    #if os(iOS)
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
            self.deleteRowHandler?(indexPath)
        }

        return [delete]
    }
    #endif

    #if os(tvOS)
    func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        self.focusedIndexPath = context.nextFocusedIndexPath
    }
    #endif
}
