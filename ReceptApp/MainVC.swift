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
        
        let r1 = Recept(title: "hello", description: "hej", color: UIColorFromHex(rgbValue: 0xFBA953))
        let r2 = Recept(title: "heasdllo", description: "hrej", color: UIColorFromHex(rgbValue: 0x62baa4))
        let r3 = Recept(title: "helfflo", description: "heeej", color: UIColorFromHex(rgbValue: 0xfb6652))
        let r4 = Recept(title: "helaalo", description: "hegj", color: UIColorFromHex(rgbValue: 0xe1702c))
        let r5 = Recept(title: "helddlo", description: "heaj", color: UIColorFromHex(rgbValue: 0x673653))
        let r6 = Recept(title: "heleelo", description: "hdcej", color: UIColorFromHex(rgbValue: 0xb0606d))
        let r7 = Recept(title: "heleelsso", description: "hdcvvej", color: UIColorFromHex(rgbValue: 0xFBA953))
        let r8 = Recept(title: "heleeddlo", description: "hdcssej", color: UIColorFromHex(rgbValue: 0x62baa4))
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
        print(recipes.count)
        return recipes.count
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }



        
        
    }


