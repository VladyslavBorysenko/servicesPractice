//
//  MessagesRouter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

protocol MessagesRouterProtocol: class {
    func sideMenuEvoke()
}

final class MessagesRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: MessagesPresenterProtocol!
}

//MARK: - Extensions
extension MessagesRouter: MessagesRouterProtocol {
    func sideMenuEvoke() {
            guard let leftMenu = SideMenuManager.default.menuLeftNavigationController else { return }
            leftMenu.navigationBar.isHidden = true
            viewController.present(leftMenu, animated: true)
    }
}
