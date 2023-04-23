//
//  UIView+.swift
//  2023.DelegatePractice
//
//  Created by 曲奕帆 on 2023/4/23.
//

import UIKit

extension UIView {
    
    // 開發時顯示border的function
    func showBorder(){
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1
    }
    
}
