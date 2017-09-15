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
        
        let r1 = Recept(title: "hello", description: "hej")
        let r2 = Recept(title: "heasdllo", description: "hrej")
        let r3 = Recept(title: "helfflo", description: "heeej")
        let r4 = Recept(title: "helaalo", description: "hegj")
        let r5 = Recept(title: "helddlo", description: "heaj")
        let r6 = Recept(title: "heleelo", description: "hdcej")
        let r7 = Recept(title: "heleelsso", description: "hdcvvej")
        let r8 = Recept(title: "heleeddlo", description: "hdcssej")
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
            
            print(indexPath.count)
            
            return cell
        } else {
            return UITableViewCell()
            
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(recipes.count)
        return recipes.count
    }
    


        
        
    }


