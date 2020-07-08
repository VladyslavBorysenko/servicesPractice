//
//  MapPresenter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/25/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol MapPresenterProtocol: class {
    func sideMenuAction()
}

final class MapPresenter: ViperPresenter {
    weak var view: MapViewProtocol!
    weak var interactor: MapInteractorProtocol!
    weak var router: MapRouterProtocol!
}
//MARK: - Extentions
extension MapPresenter: MapPresenterProtocol {
    func sideMenuAction(){
        router.sideMenuEvoked()
    }
}
