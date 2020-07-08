//
//  UsersPresenter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol UsersPresenterProtocol: class {
    func sideMenuAction()
}

final class UsersPresenter: ViperPresenter {
    weak var view: UsersViewProtocol!
    weak var interactor: UsersInteractorProtocol!
    weak var router: UsersRouterProtocol!
}

extension UsersPresenter: UsersPresenterProtocol {
    func sideMenuAction() {
        router.sideMenuEvoke()
    }
    

}
