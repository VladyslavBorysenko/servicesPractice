//
//  ExploreInteractor.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol ExploreInteractorProtocol: class {

}

final class ExploreInteractor: ViperInteractor {
    weak var presenter: ExplorePresenterProtocol!
}
//MARK: - Extensions
extension ExploreInteractor: ExploreInteractorProtocol {

}
