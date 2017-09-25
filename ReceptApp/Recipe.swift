//
//  Recipe.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-25.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import Foundation

class Recipe {
    
    private var _description: String!
    private var _imgUrl: String!
    private var _title: String!
    private var _recipeKey: String!
    
    var description: String {
        return _description
    }
    
    var imgUrl: String {
        return _imgUrl
    }
    
    var title: String! {
        return _title
    }
    
    var recipeKey: String! {
        return _recipeKey
    }
    
    init(description: String, imgUrl: String, title: String) {
        self._description = description
        self._imgUrl = imgUrl
        self._title = title
    }
    
    init(recipeKey: String, recipeData: Dictionary<String, Any>) {
        self._recipeKey = recipeKey
        
        if let description = recipeData["description"] as? String{
            self._description = description
        }
        
        if let imgUrl = recipeData["imgUrl"] as? String{
            self._imgUrl = imgUrl
        }
        
        if let title = recipeData["title"] as? String{
            self._title = title
        }
        
        
    }
    
}


