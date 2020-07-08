//
//  MyProfileViewController.swift
//  TraineeApplication
//
//  Created Vladyslav Borysenko on 11/27/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import AppusViper

protocol MyProfileViewProtocol: class {
    var userAvatarURL: URL? { get set }
    var userAvatarImage: UIImage? { get set }
    var newUserName: String? { get }
}
class MyProfileViewController: UIViewController, ViperView, CameraAlert, WarningAlert{
    
    //MARK: - Properties 
    weak var presenter: MyProfilePresenterProtocol!
    
    //MARK: - IBOutlets
    @IBOutlet weak var userAvaterImageView: UIImageView!
    @IBOutlet weak var newUserNameTextField: UITextField?
    
    
    //MARK: - IBActions
    @IBAction func sideMenuButtonPressed(_ sender: UIBarButtonItem) {
        presenter.sideMenuButtonAction()
    }
    //FIXME: - UserName texfild check for valid data, empty string
    @IBAction func changeNameButtonTapped(_ sender: UIButton) {
        presenter.changeUserNameButtonTapped()
    }
    
    //MARK: - ViewLifeCircle
    override func viewDidLoad() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapUserAvatarAction(_ :)))
        
        userAvaterImageView.addGestureRecognizer(tapGesture)
        userAvaterImageView.isUserInteractionEnabled = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    //MARK: - Functions
    @objc func tapUserAvatarAction(_ sender : UITapGestureRecognizer) {
        presenter.tapUserImageAction()
    }
}

//MARK: - Extensions
extension MyProfileViewController: MyProfileViewProtocol {
    var newUserName: String? {
        get {
            return self.newUserNameTextField?.text ?? "Empty field"
        }
    }
    
    var userAvatarImage: UIImage? {
        get {
            return userAvaterImageView.image
        }
        set {
            userAvaterImageView.image = newValue
        }
    }
    
    var userAvatarURL: URL? {
        get {
            return nil
        }
        set {
            guard newValue != nil else {return}
            self.userAvaterImageView.kf.setImage(with: newValue)
        }
    }
}
