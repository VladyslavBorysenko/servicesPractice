//
//  LaunchViewController.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 11/12/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import UIKit
import SwiftGifOrigin
import FirebaseUI

class LaunchViewController: UIViewController, FUIAuthDelegate {
    // MARK: - Properties
    var completionHandler: Completion
    
    // MARK: - IBOutlet
    @IBOutlet weak var splashViewGif: UIImageView!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSplashView()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [unowned self] in
            self.completionHandler?()
        }
    }
    // MARK: - Private
    private func loadSplashView() {
        splashViewGif.loadGif(asset: "splash")
    }
}
