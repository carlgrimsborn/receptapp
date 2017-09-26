//
//  ViewController.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-08.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit
import Firebase

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addRecipeBtn: UIButton!
    @IBOutlet weak var btntextPressed: UILabel!
    
    @IBOutlet var colorChangeBtn: UIView!
    
    var recipes = [Recipe]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRecipeBtn.layer.borderWidth = 0.5
        addRecipeBtn.layer.borderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        DataService.ds.REF_RECIPES.observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot{
                    print("SNAP: \(snap)")
                    if let recipeDict = snap.value as? Dictionary<String, Any> {
                        let key = snap.key
                        let recipe = Recipe(recipeKey: key, recipeData: recipeDict)
                        self.recipes.append(recipe)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipe = recipes[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "receptCell") as? RecipeCell {
            cell.configureCell(recipe: recipe)
            return cell
        } else {
            return RecipeCell()
        }
        
        
    }
    
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
    
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
        }

    
}










//att göra: scrollen i tableviewcell, segues runt alla skärmar, radera referenser samt tillsätt nya, de nuvarande är dåliga

//let r1 = Recept(title: "Fried Chicken", description: "Crispy as hell", color: UIColorFromHex(rgbValue: 0xFBA953), image: )
//let r2 = Recept(title: "Beaf", description: "Juicy as hell", color: UIColorFromHex(rgbValue: 0x62baa4), image: )
//let r3 = Recept(title: "Turkey", description: "Tender as hell", color: UIColorFromHex(rgbValue: 0xfb6652), image: )
//let r4 = Recept(title: "Loaf", description: "Good", color: UIColorFromHex(rgbValue: 0xe1702c), image: )
//let r5 = Recept(title: "Pork", description: "Good", color: UIColorFromHex(rgbValue: 0x673653), image: )
//let r6 = Recept(title: "Ribs", description: "BBQ spiced", color: UIColorFromHex(rgbValue: 0xb0606d), image: )
//let r7 = Recept(title: "BBQ", description: "spicy", color: UIColorFromHex(rgbValue: 0xFBA953), image: )
//let r8 = Recept(title: "Meat", description: "The best there is", color: UIColorFromHex(rgbValue: 0x62baa4), image: )
//recipes.append(r1)
//recipes.append(r2)
//recipes.append(r3)
//recipes.append(r4)
//recipes.append(r5)
//recipes.append(r6)
//recipes.append(r7)
//recipes.append(r8)
//print(tableView.numberOfSections)

