//
//  ViewController.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-08.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var addRecipeBtn: UIButton!
    @IBOutlet weak var btntextPressed: UILabel!
    
    @IBAction func pressedAddBtnEvent() {
        UIButton.animate(withDuration: 0.2, animations: {
            self.addRecipeBtn.alpha = 0.5
            self.btntextPressed.alpha = 0.5
        })
        UIButton.animate(withDuration: 0.2, animations: {
            self.addRecipeBtn.alpha = 1
            self.btntextPressed.alpha = 1
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        }

        
        
    }


