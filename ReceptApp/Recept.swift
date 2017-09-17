//
//  Recept.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-13.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import Foundation
import UIKit

class Recept {
    private var _title: String!
    private var _description: String!
    private var _color: UIColor!
    private var _image: UIImage!
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    var color: UIColor {
        return _color
    }
    
    var image: UIImage {
        return _image
    }
    
    init(title: String, description: String, color: UIColor, image: UIImage) {
        _title = title
        _description = description
        _color = color
        _image = image
    }
}
