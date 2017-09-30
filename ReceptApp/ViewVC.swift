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
    
    
    private var _selectedTitle:String = "hh"
    private var _selectedDescription: String!
    private var _selectedImage: UIImage!
    
    var selectedTitle: String {
        get {
            return _selectedTitle
        } set {
            _selectedTitle = newValue
        }
    }
    
    var selectedDescription: String {
        get {
            return _selectedDescription
        } set {
            _selectedDescription = newValue
        }
    }
    
    var selectedImage: UIImage {
        get {
            return _selectedImage
        } set {
            _selectedImage = newValue
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTitle.text = selectedTitle
    }

    
    @IBAction func goBackAction(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
