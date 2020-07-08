//
//  UsersInteractor.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol UsersInteractorProtocol: class {

}

final class UsersInteractor: ViperInteractor {
    weak var presenter: UsersPresenterProtocol!
}
//MARK: - Extensions
extension UsersInteractor: UsersInteractorProtocol {

}
