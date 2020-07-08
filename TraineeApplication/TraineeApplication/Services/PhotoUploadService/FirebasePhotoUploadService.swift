//
//  FirebasePhotoUploadService.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 12/12/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import Firebase
import FirebaseUI

class FirebasePhotoUploadService{
    private var auth = Auth.auth()
}

extension FirebasePhotoUploadService: IPhotoUploadService{
    func uploadImage(_ image: UIImage, completion: ((URL?) -> Void)?) {
        guard let userID = auth.currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("V_images/Image with user ID:\(userID)")
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "jpg"
        
        storageRef.putData(imageData, metadata: metaData) { [ unowned self ] (metadate, error) in
            if error != nil {
                print("Uploading photo Error")
                return
            } else {
                storageRef.downloadURL(completion: {(url, error)  in
                    let changeRequest = self.auth.currentUser?.createProfileChangeRequest()
                    changeRequest?.photoURL = url
                    changeRequest?.commitChanges(completion: nil)
                })
            }
    }
}
}
