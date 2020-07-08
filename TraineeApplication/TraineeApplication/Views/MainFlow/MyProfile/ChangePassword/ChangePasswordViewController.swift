//
//  ChangePasswordViewController.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/27/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol ChangePasswordViewProtocol: class {

}

class ChangePasswordViewController: UIViewController, ViperView {
    weak var presenter: ChangePasswordPresenterProtocol!
}

extension ChangePasswordViewController: ChangePasswordViewProtocol {

}
