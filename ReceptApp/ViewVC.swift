//
//  ViewVC.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-13.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class ViewVC: UIViewController {
    
    
    @IBOutlet weak var recipeImg: RoundImg!
    
    @IBOutlet weak var recipeTitle: UILabel!
    
    @IBOutlet weak var recipeDescription: BasicTextview!
    
    var recipe: Recipe!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeTitle.text = recipe.title
        recipeDescription.text = recipe.description
        
        if let img = MainVC.imageCache.object(forKey: recipe.imgUrl as NSString){
            recipeImg.image = img
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        recipeImg.makeImageRoundWithShadow()
    }
    
    @IBAction func goBackAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
