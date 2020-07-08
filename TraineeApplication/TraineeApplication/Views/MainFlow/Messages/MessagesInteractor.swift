//
//  MessagesInteractor.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/22/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol MessagesInteractorProtocol: class {

}

final class MessagesInteractor: ViperInteractor {
    weak var presenter: MessagesPresenterProtocol!
}

//MARK: - Extensions
extension MessagesInteractor: MessagesInteractorProtocol {

}
