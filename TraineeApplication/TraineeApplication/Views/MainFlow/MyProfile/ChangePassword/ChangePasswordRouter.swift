//
//  ChangePasswordRouter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/27/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangePasswordRouterProtocol: class {

}

final class ChangePasswordRouter: ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: ChangePasswordPresenterProtocol!
}

extension ChangePasswordRouter: ChangePasswordRouterProtocol {

}