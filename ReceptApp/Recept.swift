//
//  Recept.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-13.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import Foundation

class Recept {
    private var _title: String!
    private var _description: String!
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    init(title: String, description: String) {
        _title = title
        _description = description
    }
}
