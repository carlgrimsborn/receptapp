//
//  RoundImg.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-24.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class RoundImg: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func makeImageRoundWithShadow() {
        layer.masksToBounds = true
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 0.5
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = self.frame.width / 2
    }
    
}
