//
//  AppDelegate.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 11/12/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import SideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var auth: FUIAuth?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.configureDependencies()
        self.startAppFlow()
        return true
    }
    
    private func configureDependencies() {
        FirebaseApp.configure()
        self.auth = FUIAuth.defaultAuthUI()
        self.auth?.delegate = self
        self.auth?.providers = [FUIEmailAuth()]
    }
    
    func startAppFlow() {
        self.window = UIWindow()
        guard let splash = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? LaunchViewController else {
            fatalError("Splash view controller is not described")
        }
        splash.completionHandler = { [unowned self] in
            guard let authVC = self.auth?.authViewController() else { fatalError() }
            authVC.modalPresentationStyle = .fullScreen
            authVC.isNavigationBarHidden = true
            self.window?.rootViewController?.present(authVC, animated: true)
        }
        self.window?.rootViewController = splash
        self.window?.makeKeyAndVisible()
    }
    
}

//MARK: - Extensions
extension AppDelegate: FUIAuthDelegate {
    
    func authPickerViewController(forAuthUI authUI: FUIAuth) -> FUIAuthPickerViewController {
        return AuthPickerViewController(nibName: "AuthPickerViewController",
                                        bundle: nil,
                                        authUI: authUI)
    }
    
    func emailEntryViewController(forAuthUI authUI: FUIAuth) -> FUIEmailEntryViewController {
        return EmailEntryViewController(nibName: nil,
                                        bundle: nil,
                                        authUI: authUI)
    }
    func passwordSignInViewController(forAuthUI authUI: FUIAuth, email: String) -> FUIPasswordSignInViewController{
        let userDefaultsGet = UserDefaults.standard
        let storedEmail = userDefaultsGet.string(forKey: "emailText")
        
        return PasswordSignInViewController(nibName: "PasswordSignInViewController",
                                            bundle: nil,
                                            authUI: authUI,
                                            email: storedEmail ?? email)
    }
    func passwordSignUpViewController(forAuthUI authUI: FUIAuth, email: String) -> FUIPasswordSignUpViewController {
        let userDefaultsGet = UserDefaults.standard
        let storedEmail = userDefaultsGet.string(forKey: "emailText")
        
        return PasswordSignUpViewController(nibName: "PasswordSignUpViewController",
                                            bundle: nil,
                                            authUI: authUI,
                                            email: storedEmail ?? email)
    
    }
    func passwordRecoveryViewController(forAuthUI authUI: FUIAuth, email: String) -> FUIPasswordRecoveryViewController {
        let userDefaultsGet = UserDefaults.standard
        let storedEmail = userDefaultsGet.string(forKey: "emailText")
        return ForgotPasswordViewController(nibName: "ForgotPasswordViewController",
                                            bundle: nil,
                                            authUI: authUI,
                                            email: storedEmail ?? email)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        let mapViewController = UINavigationController(rootViewController: Map().view)
        mapViewController.navigationBar.isHidden = true
        mapViewController.interactivePopGestureRecognizer?.isEnabled = false
        
        let mainMenuNavigationController = UISideMenuNavigationController(rootViewController: SideMenu().view)
        SideMenuManager.default.menuLeftNavigationController = mainMenuNavigationController

        SideMenuManager.default.menuPresentMode = .viewSlideOut

        let sideMenuWidth = UIScreen.main.bounds.width * 0.9
        SideMenuManager.default.menuWidth = sideMenuWidth

        SideMenuManager.default.menuWidth = 300
        SideMenuManager.default.menuPushStyle = .defaultBehavior
        
        self.window?.rootViewController?.present(mapViewController, animated: true)
        self.window?.makeKeyAndVisible()
    }
    }

