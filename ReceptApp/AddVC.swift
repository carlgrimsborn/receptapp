//
//  AddVC.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-11.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit
import Firebase

class AddVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var addTitleTxtEdit: UITextField!
    
    @IBOutlet weak var addDescriptiontxtField: UITextView!
    
    @IBOutlet weak var imageAdd: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    var bildVald = false
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addImgTap(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {                               //posting to Firebase with this IBAction
        
        guard let title = addTitleTxtEdit.text, title != "" else {
            print("Recipe: A title must be added before posting")
            return
        }
        
        guard let img = imageAdd.image, bildVald == true else {                          //assuming a image is in the addimage image button
            print("Recipe: A selected image must be selected")
            return
        }
        
        if let imgData = UIImageJPEGRepresentation(img, 0.2) {              //this data can be set to the firebase storage, compressed image
            
            let imgUid = NSUUID().uuidString
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            //posting this image data to Firebase storage using the storage reference variable from DataService.swift
            
            DataService.ds.REF_RECIPE_IMAGES.child(imgUid).putData(imgData, metadata: metadata) { (metadata, error) in
                if error != nil {
                    print("Recipe: Unable to upload image to Firebase Storage")
                } else {                                                                    //uploaded to storage
                    print("Recipe: Successfully uploaded image to Firebase Storage")
                    let downloadURL = metadata?.downloadURL()?.absoluteString               //getting url for uploaded image
                    self.postToFirebase(imgUrl: downloadURL!)                               //calling postToFirebase function with inserted url. this url from firebase will later be refered by MainVCs imagecache to get the image from firebase storage
                    
                }
            
            }
        }
        
        
        //dismiss the view
        dismiss(animated: true, completion: nil)
    }
    
    func postToFirebase(imgUrl: String) {                       //function for post to firebase
        let recipe: Dictionary<String, Any> = [                 //global object
            "description": addDescriptiontxtField.text,
            "imgUrl": imgUrl,
            "title": addTitleTxtEdit.text!
        ]
        
        let firebaseRecipe = DataService.ds.REF_RECIPES.child(byAppendingPath: addTitleTxtEdit.text!)    //ref the child
        firebaseRecipe.setValue(recipe)                                         //set the value of this firebase object to the global object-
                                                                                //using the the reference firebaseRecipe
        addTitleTxtEdit.text = ""
        addDescriptiontxtField.text = ""
        bildVald = false
        imageAdd.image = #imageLiteral(resourceName: "addbuttonimg")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDescriptiontxtField.layer.cornerRadius = 1
        addDescriptiontxtField.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        self.addDescriptiontxtField.delegate = self
        self.addTitleTxtEdit.delegate = self
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTitleTxtEdit.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        addDescriptiontxtField.resignFirstResponder()
        return true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageAdd.image = image                                                      //set the image on the button to the selected img
            bildVald = true
        } else {
            print("bad")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }


}
