//
//  PasswordSignUpViewController.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 11/14/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import UIKit
import FirebaseUI

class PasswordSignUpViewController: FUIPasswordSignUpViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let userDefaultsGet = UserDefaults.standard
        guard let userDefaultsEmailText = userDefaultsGet.object(forKey: "emailText") as? String else {return}
        emailTextField.text = userDefaultsEmailText
    }

    // MARK: - IBActions
    @IBAction func signInPressed(_ sender: UIButton) {
        guard let emailText = emailTextField.text else {return}
        guard let passwordText = passwordTextField.text else {return}
        guard let username = nameTextField.text else {return}
        
        didChangeEmail(emailText, orPassword: passwordText, orUserName: username)
        signUp(withEmail: emailText, andPassword: passwordText, andUsername: username)
        
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        onBack()
    }
    

}
