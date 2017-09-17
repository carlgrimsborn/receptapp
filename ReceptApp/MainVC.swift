//
//  ViewController.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-08.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addRecipeBtn: UIButton!
    @IBOutlet weak var btntextPressed: UILabel!
    
    
    var recipes = [Recept]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let r1 = Recept(title: "Fried Chicken", description: "Crispy", color: UIColorFromHex(rgbValue: 0xFBA953), image: #imageLiteral(resourceName: "empty-plate"))
        let r2 = Recept(title: "Beaf", description: "Juicy", color: UIColorFromHex(rgbValue: 0x62baa4), image: #imageLiteral(resourceName: "empty-plate"))
        let r3 = Recept(title: "Turkey", description: "Tender as hell", color: UIColorFromHex(rgbValue: 0xfb6652), image: #imageLiteral(resourceName: "empty-plate"))
        let r4 = Recept(title: "Loaf", description: "Good", color: UIColorFromHex(rgbValue: 0xe1702c), image: #imageLiteral(resourceName: "empty-plate"))
        let r5 = Recept(title: "Pork", description: "fresh from pig", color: UIColorFromHex(rgbValue: 0x673653), image: #imageLiteral(resourceName: "empty-plate"))
        let r6 = Recept(title: "Ribs", description: "BBQ filled", color: UIColorFromHex(rgbValue: 0xb0606d), image: #imageLiteral(resourceName: "empty-plate"))
        let r7 = Recept(title: "BBQ", description: "Cool", color: UIColorFromHex(rgbValue: 0xFBA953), image: #imageLiteral(resourceName: "empty-plate"))
        let r8 = Recept(title: "Meat", description: "The best there is", color: UIColorFromHex(rgbValue: 0x62baa4), image: #imageLiteral(resourceName: "empty-plate"))
            recipes.append(r1)
            recipes.append(r2)
            recipes.append(r3)
            recipes.append(r4)
            recipes.append(r5)
            recipes.append(r6)
            recipes.append(r7)
            recipes.append(r8)
        print(tableView.numberOfSections)
        
    }
    
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
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "receptCell", for: indexPath) as? RecipeCell{
            
            let recept = recipes[indexPath.row]
            
            cell.updateUI(recept: recept)
            
            
            return cell
        } else {
            return UITableViewCell()
            
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return recipes.count
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }



        
        
    }


