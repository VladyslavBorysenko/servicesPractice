//
//  ExploreRouter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

protocol ExploreRouterProtocol: class {
    func sideMenuEvoke()
}

final class ExploreRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: ExplorePresenterProtocol!
}
//MARK: - Extensions
extension ExploreRouter: ExploreRouterProtocol {
    func sideMenuEvoke() {
        guard let leftMenu = SideMenuManager.default.menuLeftNavigationController else { return }
            leftMenu.navigationBar.isHidden = true
            viewController.present(leftMenu, animated: true)
    }
    
}
