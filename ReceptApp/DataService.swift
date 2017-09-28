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
let STORAGE_BASE = Storage.storage().reference()

class DataService {                                                     //All referenses to firebase database is here
    static let ds = DataService()
    
    //DB referenses
    private var _REF_BASE = DB_BASE
    private var _REF_RECIPES = DB_BASE.child("Recipes")                 //Refers to all recipes in Firebase
    
    //Storage referenses
    private var _REF_RECIPE_IMAGES = STORAGE_BASE.child("recipe-pics")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    var REF_RECIPES: DatabaseReference {
        return _REF_RECIPES
    }
    var REF_RECIPE_IMAGES: StorageReference {
        return _REF_RECIPE_IMAGES
    }
    
}
