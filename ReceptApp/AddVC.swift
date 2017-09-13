//
//  AddVC.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-11.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class AddVC: UIViewController {

    @IBOutlet weak var addTitleTxtEdit: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var addDescriptionTxtEdit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBtn.layer.cornerRadius = 10
        addBtn.clipsToBounds = true
        
        
    }


}
