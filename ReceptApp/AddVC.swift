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
    
    @IBOutlet weak var addDescriptiontxtField: UITextView!
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addDescriptiontxtField.layer.cornerRadius = 1
        addDescriptiontxtField.clipsToBounds = true
        
        
    }


}
