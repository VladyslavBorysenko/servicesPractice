//
//  PasswordSignInViewController.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 11/13/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import UIKit
import FirebaseUI

class PasswordSignInViewController: FUIPasswordSignInViewController{
    
    //MARK: - IBOutlets
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaultsGet = UserDefaults.standard
        guard let userDefaultsEmailText = userDefaultsGet.object(forKey: "emailText") as? String else {return}
        print(userDefaultsEmailText)
        emailTextField.text = userDefaultsEmailText
        
            
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let emailText = emailTextField.text else {return}
        guard let passwordText = passwordTextField.text else {return}
        didChangeEmail(emailText, andPassword: passwordText)
        signIn(withDefaultValue: emailText, andPassword: passwordText)
        
    }
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        guard let emailText = emailTextField.text else {return}
        forgotPassword(forEmail: emailText)
        
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        onBack()
    }
    

}
