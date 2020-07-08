//
//  MyProfile.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/27/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

class MyProfile: Module<MyProfileViewController, MyProfilePresenter, MyProfileInteractor, MyProfileRouter> {
    override init() {
        super.init()
        self.interactor.photoUploadService = FirebasePhotoUploadService()
        self.interactor.userRepository = FirebaseUserRepository()
    }
}
