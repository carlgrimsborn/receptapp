//
//  ChangeColorButton.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-11.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class ChangeColorButton: UIButton {

    let button = UIButton(frame: CGRect(x: 0, y: 100, width: 50, height: 50))
    self.button.layer.backgroundColor = UIColor.clear.cgColor
    self.view.addSubview(button)
    
    func makeRedButton() {
        
        UIView.animate(withDuration: 1.0) {
            self.button.layer.backgroundColor =  UIColor.red.cgColor
        }
        
    }

}
