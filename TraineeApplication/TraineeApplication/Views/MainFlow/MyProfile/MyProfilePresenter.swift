//
//  MyProfilePresenter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/27/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper
import Kingfisher

protocol MyProfilePresenterProtocol: class {
    func sideMenuButtonAction()
    func tapUserImageAction()
    func changeUserNameButtonTapped()
    func showWarningAlert(message: String)
    func changeUserAvatar(image: UIImage)
    func evokeUploadImage(_ image: UIImage, completion: @escaping ((_ url: URL?) -> Void))
}

final class MyProfilePresenter: NSObject, ViperPresenter{
    
    
    //MARK: - Properties
    weak var view: (MyProfileViewProtocol & CameraAlert & WarningAlert)!
    weak var interactor: MyProfileInteractorProtocol!
    weak var router: MyProfileRouterProtocol!
    
    //MARK: - Functions
    func tapUserImageAction() {
        
       self.router.imagePickerEvoke()
        
        view.displayChooseAlert(alertTitle: nil, photoCompletionHandler: { [unowned self] _ in
            self.router.galleryImagePickerEvoke()
            }, cameraComplitionHandler: { [unowned self] _ in
                self.router.cameraImagePickerEvoke()
        })
    }
    func showWarningAlert(message: String){
        view.displayWarningInformation(alertMessage: message)
    }
}

extension MyProfilePresenter: MyProfilePresenterProtocol {
    
    //MARK: - Functions
    func changeUserNameButtonTapped() {
        interactor.userName = view.newUserName
    }
    func sideMenuButtonAction() {
        router.sideMenuEvoke()
    }
    func changeUserAvatar(image: UIImage){
        self.view.userAvatarImage = image
    }
    func evokeUploadImage(_ image: UIImage, completion: @escaping ((_ url: URL?) -> Void)){
        self.interactor.uploadImage(image, completion: completion)
    }
}

