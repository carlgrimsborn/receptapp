//
//  CellsideView.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-30.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class CellsideView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 1.0).cgColor

    }
    

}
