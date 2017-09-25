//
//  BottomBtn.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-24.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class BottomBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 1.0).cgColor
        layer.cornerRadius = 10
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 1.0).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 0.5
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
       
      
        
    }

}
