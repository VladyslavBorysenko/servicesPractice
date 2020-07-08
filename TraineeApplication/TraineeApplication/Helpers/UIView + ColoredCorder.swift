//
//  Extensions.swift
//  TraineeApplication
//
//  Created by Vladyslav Borysenko on 11/28/19.
//  Copyright © 2019 Vladyslav Borysenko. All rights reserved.
//

import UIKit

extension UIView {
    func addBorderAndColor(color: UIColor, width: CGFloat, corner_radius: CGFloat = 0, clipsToBounds: Bool = false) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = corner_radius
        self.clipsToBounds = clipsToBounds
    }
}
