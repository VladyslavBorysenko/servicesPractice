//
//  IPhotoUploadService.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 12/12/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import UIKit

protocol IPhotoUploadService: class{
    func uploadImage(_ image: UIImage, completion: ((_ url: URL?) -> Void)?)
}
