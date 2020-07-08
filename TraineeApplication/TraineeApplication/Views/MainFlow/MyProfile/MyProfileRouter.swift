//
//  MyProfileRouter.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/27/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper
import SideMenu

//MARK: - Protocols
protocol MyProfileRouterProtocol: class {
    func sideMenuEvoke()
    func imagePickerEvoke()
    func cameraImagePickerEvoke()
    func galleryImagePickerEvoke()
}

final class MyProfileRouter: NSObject, ViperRouter {
    weak var viewController: UIViewController!
    weak var presenter: MyProfilePresenterProtocol!
    var imagePicker = UIImagePickerController()
}

// MARK: - Extensions
extension MyProfileRouter: MyProfileRouterProtocol {
    func cameraImagePickerEvoke() {
        self.imagePicker.sourceType = .camera
        self.viewController.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func galleryImagePickerEvoke() {
        self.imagePicker.sourceType = .photoLibrary
        self.viewController.present(self.imagePicker, animated: true, completion: nil)
    }
    
// Appoint router delegate of ImagePicker
    func imagePickerEvoke() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    func sideMenuEvoke() {
        guard let leftMenu = SideMenuManager.default.menuLeftNavigationController else { return }
        leftMenu.navigationBar.isHidden = true
        viewController.present(leftMenu, animated: true)
    }
}

extension MyProfileRouter:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            //Have to call presenter method userPhotoChange to change user avatar
            self.presenter.changeUserAvatar(image: pickedImage)
            //Have to call presenter method for upload photo to firebase
            self.presenter.evokeUploadImage(pickedImage, completion: { (url) in })
        }
        self.viewController.dismiss(animated: true, completion: nil)
    }
}
