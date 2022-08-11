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

extension UIImageView {

    func setURLImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(systemName: "rosette")
            return
        }
        DispatchQueue.global().async { [weak self] in
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self?.image = data != nil ? UIImage(data: data!) : UIImage(named: "arrow.clockwise")
            }
        }
    }
}
