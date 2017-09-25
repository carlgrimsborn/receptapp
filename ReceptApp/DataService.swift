//
//  DataService.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-25.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    static let ds = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_RECIPES = DB_BASE.child("Recipes")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    var REF_RECIPES: DatabaseReference {
        return _REF_RECIPES
    }
    
    
}
