//
//  ChangePasswordInteractor.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/27/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangePasswordInteractorProtocol: class {

}

final class ChangePasswordInteractor: ViperInteractor {
    weak var presenter: ChangePasswordPresenterProtocol!
}

extension ChangePasswordInteractor: ChangePasswordInteractorProtocol {

}
