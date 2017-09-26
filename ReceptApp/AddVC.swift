//
//  AddVC.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-11.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class AddVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var addTitleTxtEdit: UITextField!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var addDescriptiontxtField: UITextView!
    
    @IBOutlet weak var imageAdd: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addImgTap(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDescriptiontxtField.layer.cornerRadius = 1
        addDescriptiontxtField.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageAdd.image = image
        } else {
            print("bad")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }


}
