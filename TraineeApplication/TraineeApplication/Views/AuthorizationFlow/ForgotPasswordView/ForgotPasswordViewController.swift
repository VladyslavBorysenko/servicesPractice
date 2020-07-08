//
//  ForgotPasswordViewController.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 11/14/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import UIKit
import FirebaseUI

class ForgotPasswordViewController: FUIPasswordRecoveryViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaultsGet = UserDefaults.standard
        guard let userDefaultsEmailText = userDefaultsGet.object(forKey: "emailText") as? String else {return}
        emailTextField.text = userDefaultsEmailText
    }
    
    // MARK: - IBActions
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        guard let emailText = emailTextField.text else {return}
        didChangeEmail(emailText)
        recoverEmail(emailText)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        onBack()
    }
    

}
