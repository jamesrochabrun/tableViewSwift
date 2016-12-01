//
//  ViewController.swift
//  recetas
//
//  Created by James Rochabrun on 11/30/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    var recipes: [Recepie] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.dataSource = self
//        self.tableView.delegate = self
        
//        var recipe1 = Recepie(name: "torta", image:#imageLiteral(resourceName: "uno.png"))
//        recipes.append(recipe1)
//        
//        var recipe2 = Recepie(name: "pizza", image:#imageLiteral(resourceName: "dos.png"))
//        recipes.append(recipe2)
//        
//        var recipe3 = Recepie(name: "burguer", image:#imageLiteral(resourceName: "tres.png"))
//        recipes.append(recipe3)
//        
//        var recipe4 = Recepie(name: "salad", image:#imageLiteral(resourceName: "cuatro.jpg"))
//        recipes.append(recipe4)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    


}




extension ViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        let recipe = recipes[indexPath.row]
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        return cell
    }
    
}



