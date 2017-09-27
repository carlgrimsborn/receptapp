//
//  RecipeCell.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-13.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit
import Firebase

class RecipeCell: UITableViewCell {
    
    @IBOutlet var recipeImage: UIImageView!
    
    @IBOutlet var ContentView: UIView!
    
    @IBOutlet weak var testText: UILabel!
    
    @IBOutlet var stackView: UIStackView!
    
    var recipe: Recipe!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configureCell(recipe: Recipe, img: UIImage? = nil) {                                    //function to update the UI to the cell
        self.recipe = recipe
        self.testText.text = recipe.title
        
        if img != nil {
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










//    func updateUI(recept: Recept){
//        testText.text = recept.title
//        recipeImage.image = recept.image
//
//        }



//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
