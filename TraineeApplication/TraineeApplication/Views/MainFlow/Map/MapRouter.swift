//
//  MapRouter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/25/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

protocol MapRouterProtocol: class {
    func sideMenuEvoked()
}

final class MapRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: MapPresenterProtocol!
}

//MARK: - Extensions
extension MapRouter: MapRouterProtocol {
    func sideMenuEvoked() -> Void{
        guard let leftMenu = SideMenuManager.default.menuLeftNavigationController else { return }
        leftMenu.navigationBar.isHidden = true
        viewController.present(leftMenu, animated: true)
    }
}
