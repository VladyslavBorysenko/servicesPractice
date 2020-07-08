//
//  MapViewController.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/25/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol MapViewProtocol: class {

}

class MapViewController: UIViewController, ViperView {
    weak var presenter: MapPresenterProtocol!
    
    //MARK: - IBActions
    @IBAction func sideMenuButtonPressed(_ sender: UIBarButtonItem) {
        presenter.sideMenuAction()
    }
}
//MARK: - Extensions
extension MapViewController: MapViewProtocol {
}
