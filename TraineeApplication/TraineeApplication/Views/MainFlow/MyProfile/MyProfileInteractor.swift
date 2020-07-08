//
//  MyProfileInteractor.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/27/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper
import Firebase
import FirebaseStorage

protocol MyProfileInteractorProtocol: class {
    func uploadImage(_ image: UIImage, completion: @escaping ((_ url: URL?) -> Void))
    var userName: String? { get set }
    var avatarUrl: URL? { get set }
}

final class MyProfileInteractor: ViperInteractor {
    weak var presenter: MyProfilePresenterProtocol!
    var photoUploadService: IPhotoUploadService!
    var userRepository: IUserRepository!
}

extension MyProfileInteractor: MyProfileInteractorProtocol {
    
    var userName: String? {
        get {
            return self.userRepository.userName
        }
        set {
            self.userRepository.userName = newValue
        }
    }
    
    var avatarUrl: URL? {
        get {
            return self.userRepository.avatarUrl
        }
        set {
            self.userRepository.avatarUrl = newValue
        }
    }
    
    func uploadImage(_ image: UIImage, completion: @escaping ((_ url: URL?) -> Void)) {
        photoUploadService.uploadImage(image, completion: nil)
    }

}
