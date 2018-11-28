//
//  TasksListViewTableViewDelegate.swift
//  Listy-iOS
//
//  Created by Kevin Wolkober on 11/26/18.
//

import UIKit

class TasksListViewTableViewDelegate: NSObject {

    var didSelectRowHandler: ((IndexPath) -> Void)?
    var deleteRowHandler: ((IndexPath) -> Void)?
}

extension TasksListViewTableViewDelegate: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectRowHandler?(indexPath)
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
            self.deleteRowHandler?(indexPath)
        }

        return [delete]
    }
}
