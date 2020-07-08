//
//  ExplorePresenter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol ExplorePresenterProtocol: class {
    func sideMenuAction()
}

final class ExplorePresenter: ViperPresenter {
    weak var view: ExploreViewProtocol!
    weak var interactor: ExploreInteractorProtocol!
    weak var router: ExploreRouterProtocol!
}

//MARK: - Extensions
extension ExplorePresenter: ExplorePresenterProtocol {
    func sideMenuAction() {
        router.sideMenuEvoke()
    }
    
    
}
