//
//  LogoutService.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 11/26/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import Foundation
import Firebase

class LogoutService: LogoutProtocol{
     
    private var firebaseAuth = Auth.auth()
    
    func logout() {
        do {
            try firebaseAuth.signOut()
        } catch {
            print("Firebase logout services are not avaliable")
        }
    
}
}
