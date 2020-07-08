//
//  MessagesPresenter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol MessagesPresenterProtocol: class {
    func sideMenuAction()
}

final class MessagesPresenter: ViperPresenter {
    weak var view: MessagesViewProtocol!
    weak var interactor: MessagesInteractorProtocol!
    weak var router: MessagesRouterProtocol!
}

//MARK: - Extensinos
extension MessagesPresenter: MessagesPresenterProtocol {
    func sideMenuAction() {
        router.sideMenuEvoke()
    }
    

}
