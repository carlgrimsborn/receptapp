//
//  ViewController.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-08.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit
import Firebase
import RevealingTableViewCell

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addRecipeBtn: UIButton!
    @IBOutlet weak var btntextPressed: UILabel!
    
    @IBOutlet var colorChangeBtn: UIView!
    
    var recipes = [Recipe]()
    static var imageCache: NSCache<NSString, UIImage> = NSCache()
    
    public static var main = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainVC") as! MainVC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRecipeBtn.layer.borderWidth = 0.5
        addRecipeBtn.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        DataService.ds.REF_RECIPES.observe(.value, with: { (snapshot) in        //function to set each recipes array object to db values
            
            self.recipes = []
            
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {         //snapshot works like the object of the db
                for snap in snapshot{
                    print("SNAP: \(snap)")
                    if let recipeDict = snap.value as? Dictionary<String, Any> {        //each food object has the value of a dict
                        let key = snap.key
                        let recipe = Recipe(recipeKey: key, recipeData: recipeDict)
                        self.recipes.append(recipe)                               //appending to recipes array from array of snaps
                    }
                }
            }
            self.tableView.reloadData()
        })
        
    }
    
    
    @IBAction func pressedAddBtnEvent() {
        UIButton.animate(withDuration: 0.2, animations: {
            self.colorChangeBtn.alpha = 0.2
            self.btntextPressed.alpha = 0.5
        })
        UIButton.animate(withDuration: 0.2, animations: {
            self.colorChangeBtn.alpha = 0.0
            self.btntextPressed.alpha = 1
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {               //one section
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {       //number of cells
        
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {    //Setting the UI for cell
        
        let recipe = recipes[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "receptCell") as? RecipeCell {
            
            cell.cellIndex = indexPath.row
            if let img = MainVC.imageCache.object(forKey: recipe.imgUrl as NSString){
                cell.configureCell(recipe: recipe, img: img)                            //setting the image from the cache object
            } else {
                cell.configureCell(recipe: recipe, img: nil)
            }
            
            // assign self object to the delegate
            cell.revealingCellDelegate = self
            return cell
        } else {
            return RecipeCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath) as! RecipeCell
        
        // Checking revealing state is open or close, if open will close, if closed, then can perform action in else section whatever you want
        if cell.revealingState != .closed
        {
            cell.setRevealingState(.closed, animated: true)
        }
        else
        {
            // do something else.
        }
    }
    
    func segueToTheViewVC(sender: UIButton) {
        performSegue(withIdentifier: "viewVC", sender: sender)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewVC {
            if let senderObj = sender as? UIButton  {
                if senderObj.accessibilityIdentifier == "VIEW" {
                    let recipe = self.recipes[senderObj.tag]
                    destination.recipe = recipe
                }
            }
        }
    }
    
}


// Managing Revealing section to get closed if open on scroll
extension MainVC: UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        self.tableView.closeAllCells()
    }
}

// Managing Revealing section to get closed all except the current on which pan gesture is active
extension MainVC: RevealingTableViewCellDelegate
{
    func didStartPanGesture(cell: RevealingTableViewCell)
    {
        self.tableView.closeAllCells(exceptThisOne: cell)
    }
}





