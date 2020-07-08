//
//  AlertHelper.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 11/26/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import UIKit
import AppusViper

//MARK: - Protocols

protocol LogoutAlert: class {
    func displayAlert(alertTitle: String, alertMessage: String, completionHandler: ((UIAlertAction) -> Void)?)
}
protocol CameraAlert: class {
   func displayChooseAlert(alertTitle: String?, photoCompletionHandler: ((UIAlertAction) -> Void)?, cameraComplitionHandler: ((UIAlertAction) -> Void)? )
}
protocol WarningAlert: class {
    func displayWarningInformation(alertMessage: String)
}

// MARK: - Extensions

extension LogoutAlert where Self: UIViewController{
    func displayAlert(alertTitle: String, alertMessage: String, completionHandler: ((UIAlertAction) -> Void)?){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Exit", style: .default, handler: completionHandler))
        
        self.present(alert, animated: true)
    }
}

extension CameraAlert where Self: UIViewController {
    func displayChooseAlert(alertTitle: String?, photoCompletionHandler: ((UIAlertAction) -> Void)?, cameraComplitionHandler: ((UIAlertAction) -> Void)? ){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let actionPhoto = UIAlertAction(title: "Gallery", style: .default, handler: photoCompletionHandler)
        let actionCamera = UIAlertAction(title: "Camera", style: .default, handler: cameraComplitionHandler)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension WarningAlert where Self: UIViewController{
    func displayWarningInformation(alertMessage: String){
        let alert = UIAlertController(title: nil, message: alertMessage, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

