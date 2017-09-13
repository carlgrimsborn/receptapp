//
//  RecipeCell.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-13.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    
    @IBOutlet weak var testText: UILabel!
    
    @IBOutlet weak var recipeScrollView: UIScrollView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(recept: Recept){
        testText.text = recept.title
    }

}


//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
