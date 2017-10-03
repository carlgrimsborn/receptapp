//
//  RecipeCell.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-13.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit
import Firebase
import RevealingTableViewCell


class RecipeCell: RevealingTableViewCell {
    
    @IBOutlet var recipeImage: UIImageView!
    
    @IBOutlet var ContentView: UIView!
    
    @IBOutlet weak var testText: UILabel!
    
    @IBOutlet weak var delView: UIView!
    
    @IBOutlet weak var showView: UIView!
    
    
    var recipe: Recipe!
    var cellIndex: Int?
    
    @IBAction func trashBtnPressed(_ sender: Any) {
        
        
        UIButton.animate(withDuration: 0.2, animations: {
            self.delView.alpha = 0.2
        })
        UIButton.animate(withDuration: 0.2, animations: {
            self.delView.alpha = 0.0
        })
        
        //Delete from Firebase
        
        if let keyString = testText.text {
            
            let firebaseRecipe = DataService.ds.REF_RECIPES.child(keyString)
            firebaseRecipe.removeValue()
            print("Recipe: Removed \(keyString) from firebase")
            
        }
        
        
    }
    
    @IBAction func viewbtnPressed(_ sender: UIButton) {
        
        UIButton.animate(withDuration: 0.2, animations: {
            self.showView.alpha = 0.2
        })
        UIButton.animate(withDuration: 0.2, animations: {
            self.showView.alpha = 0.0
        })
        
        if let cellIndex = cellIndex {
            sender.tag = cellIndex
            sender.accessibilityIdentifier = "VIEW"
            
            MainVC.main.segueToTheViewVC(sender: sender)
        }
    }
    
    var passingDesc: String!
    
    func configureCell(recipe: Recipe, img: UIImage? = nil) {                                    //function to update the UI to the cell
        self.recipe = recipe
        self.testText.text = recipe.title
        self.passingDesc = recipe.description
        
        if img != nil {                                                                          //function for download image
            self.recipeImage.image = img
        } else {
            let ref = Storage.storage().reference(forURL: recipe.imgUrl)
            ref.getData(maxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print("Recipe: unable to download image from firebase storage")
                } else {
                    print("Recipe: succesfully downloaded image from firebase storage")
                    if let imgData = data {
                        if let img = UIImage(data: imgData){
                            self.recipeImage.image = img
                            MainVC.imageCache.setObject(img, forKey: recipe.imgUrl as NSString)
                        }
                    }
                }
            })
        }
    }
    
    
}
