//
//  Post.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-25.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import Foundation

class Post {
    
    private var _description: String!
    private var _imgUrl: String!
    private var _title: String!
    private var _postKey: String!
    
    var description: String {
        return _description
    }
    
    var imgUrl: String {
        return _imgUrl
    }
    
    var title: String! {
        return _title
    }
    
    var postKey: String! {
        return _postKey
    }
    
    init(description: String, imgUrl: String, title: String) {
        self._description = description
        self._imgUrl = imgUrl
        self._title = title
    }
    
    init(postKey: String, postData: Dictionary<String, Any>) {
        self._postKey = postKey
        
        if let description = postData["description"] as? String{
            self._description = description
        }
        
        if let imgUrl = postData["imgUrl"] as? String{
            self._imgUrl = imgUrl
        }
        
        if let title = postData["title"] as? String{
            self._title = title
        }
        
        
    }
    
}


