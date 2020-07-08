//
//  ExploreViewController.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol ExploreViewProtocol: class {

}

class ExploreViewController: UIViewController, ViperView {
    weak var presenter: ExplorePresenterProtocol!
    
    //MARK: - IBActions
    @IBAction func sideMenuButtonPressed(_ sender: UIBarButtonItem) {
        presenter.sideMenuAction()
    }
}
//MARK: - Extensions
extension ExploreViewController: ExploreViewProtocol {

}
