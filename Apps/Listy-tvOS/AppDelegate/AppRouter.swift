//
//  AppRouter.swift
//  Listy-tvOS
//
//  Created by Kevin Wolkober on 12/3/18.
//

import UIKit
import ListyKit

class AppRouter: AppRouterInput {

    func configureInitialRoute(for appDelegate: AppDelegate) {
        let database = Database.newInstance()
        let lists = Lists(database: database)
        let tasks = Tasks(database: database)

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ListsRouter.scene(lists: lists, tasks: tasks)
        window.makeKeyAndVisible()

        appDelegate.window = window
    }
}
