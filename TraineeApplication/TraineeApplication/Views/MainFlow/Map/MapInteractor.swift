//
//  MapInteractor.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/25/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol MapInteractorProtocol: class {

}

final class MapInteractor: ViperInteractor {
    weak var presenter: MapPresenterProtocol!
}
//MARK: - Extensions
extension MapInteractor: MapInteractorProtocol {

}
