//
//  MessagesViewController.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol MessagesViewProtocol: class {

}

class MessagesViewController: UIViewController, ViperView {
    weak var presenter: MessagesPresenterProtocol!
    
    //MARK: - IBActions
    @IBAction func sideMenuButtonPressed(_ sender: UIBarButtonItem) {
        presenter.sideMenuAction()
    }
}
// MARK: - Extensions
extension MessagesViewController: MessagesViewProtocol {

}
