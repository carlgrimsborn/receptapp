//
//  ViewController.swift
//  ReceptApp
//
//  Created by Carl Grimsborn on 2017-09-08.
//  Copyright © 2017 Carl Grimsborn. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bord: UITableView!
    @IBOutlet weak var addRecipeBtn: UIButton!
    @IBOutlet weak var btntextPressed: UILabel!
    
    
    var recipes = [Recept]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let r1 = Recept(title: "hello", description: "hej")
        let r2 = Recept(title: "hello", description: "hej")
        let r3 = Recept(title: "hello", description: "hej")
        let r4 = Recept(title: "hello", description: "hej")
        let r5 = Recept(title: "hello", description: "hej")
        let r6 = Recept(title: "hello", description: "hej")
            recipes.append(r1)
            recipes.append(r2)
            recipes.append(r3)
            recipes.append(r4)
            recipes.append(r5)
            recipes.append(r6)
        
        
            bord.delegate = self
            bord.dataSource = self

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
            
            let recipe = recipes[indexPath.row]
            
            cell.updateUI(recept: recipe)
            
            return cell
        } else {
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    


        
        
    }


