//
//  UsersRouter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

protocol UsersRouterProtocol: class {
    func sideMenuEvoke()
}

final class UsersRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: UsersPresenterProtocol!
}

//MARK: - Extensions
extension UsersRouter: UsersRouterProtocol {
    func sideMenuEvoke() {
        guard let sideMenu = SideMenuManager.default.menuLeftNavigationController else {return}
        sideMenu.navigationBar.isHidden = true
        viewController.present(sideMenu, animated: true)
    }
    

}
