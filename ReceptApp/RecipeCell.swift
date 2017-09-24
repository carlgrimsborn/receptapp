//
//  RecipeCell.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-13.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet var recipeImage: UIImageView!
    
    @IBOutlet var ContentView: UIView!
    
    @IBOutlet weak var testText: UILabel!
    
    @IBOutlet var stackView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func updateUI(recept: Recept){
        testText.text = recept.title
        recipeImage.image = recept.image
        
        }
   
    
    
}


//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
