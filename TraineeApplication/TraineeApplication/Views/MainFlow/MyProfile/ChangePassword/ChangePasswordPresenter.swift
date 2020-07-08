//
//  ChangePasswordPresenter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/27/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangePasswordPresenterProtocol: class {

}

final class ChangePasswordPresenter: ViperPresenter {
    weak var view: ChangePasswordViewProtocol!
    weak var interactor: ChangePasswordInteractorProtocol!
    weak var router: ChangePasswordRouterProtocol!
}

extension ChangePasswordPresenter: ChangePasswordPresenterProtocol {

}
