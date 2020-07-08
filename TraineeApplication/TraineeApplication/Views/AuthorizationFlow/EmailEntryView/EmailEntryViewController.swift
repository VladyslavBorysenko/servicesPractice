//
//  EmailEntryViewController.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 11/13/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import UIKit
import FirebaseUI

class EmailEntryViewController: FUIEmailEntryViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        closeKeyboard()
    }
    
    func closeKeyboard(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        self.view.addGestureRecognizer(tap)
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let userDafaults = UserDefaults.standard
        
        guard let emailText = emailTextField.text else {return}
        
        userDafaults.set(emailText, forKey: "emailText")
        
        onNext(emailText)
        //didChangeEmail(emailText)
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        onBack()
    }
    

}

