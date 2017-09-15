//
//  RecipeCell.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-13.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    
    @IBOutlet var ContentView: UIView!
    
    @IBOutlet weak var testText: UILabel!
    
    public var constant = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    func updateUI(recept: Recept){
        testText.text = recept.title
        ContentView.backgroundColor = recept.color
        }
   
    
    
}


//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
