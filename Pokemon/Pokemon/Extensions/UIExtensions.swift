//
//  UIExtensions.swift
//  Pokemon
//
//  Created by Rumeysa TAN on 10.08.2022.
//

import Foundation
import UIKit

extension UIView{
    
    func roundCorner() {
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}
