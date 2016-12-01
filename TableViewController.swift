//
//  TableViewController.swift
//  recetas
//
//  Created by James Rochabrun on 11/30/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var recipes: [Recepie] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Mis recetas"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.hidesBarsOnSwipe = true
     

        let recipe1 = Recepie(name: "torta", image:#imageLiteral(resourceName: "chatList") , time:20, ingredients:["harina", "huevos"], steps:["lavar huevo y si se uoiete mete jej jejje;jkebf;jkb;jkbejkwbv;jkbwejkbwvjkbwjkvbwjkvwdbjkvwdkjvbdjkvbdjkwvbdjkwbvkj", "cocer pastel"])
        recipes.append(recipe1)
        
        let recipe2 = Recepie(name: "pizza", image:#imageLiteral(resourceName: "customize"), time:215, ingredients:["harina", "huevos"], steps:["lavar huevowkljh;kwdjvhjkvwbw;bdjkvdjkbdjkvbd;jkbwd;jkvbwdvjk", "cocer pastel"])
        recipes.append(recipe2)
        
        let recipe3 = Recepie(name: "burguer", image:#imageLiteral(resourceName: "chatBox"), time:23, ingredients:["harina", "huevos"], steps:["lavar huevo", "cocer pastel"])
        recipes.append(recipe3)
        
        let recipe4 = Recepie(name: "salad", image:#imageLiteral(resourceName: "gps")
            , time:25, ingredients:["harina", "huevos"], steps:["lavar huevo", "cocer pastel"])
        recipes.append(recipe4)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell

        // Configure the cell...
        let recipe = recipes[indexPath.row]
        cell.titleLabel.text = recipe.name
        cell.avatarView.image = recipe.image
        cell.subTitleLabel.text = "\(recipe.timecook!) min"
        cell.thirdLabel.text = "amount of ingredients \(recipe.ingredients.count)"
//        if recipe.isFavorite {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
      

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let recipe = self.recipes[indexPath.row]
//        
//        let alertController = UIAlertController(title:recipe.name, message: "VALORA ESTE PLATO", preferredStyle: .actionSheet)
//        let buttonCancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
//        
//        var favoriteActionTitle = "Favorite"
//        var favoriteActionStyle = UIAlertActionStyle.default
//        if recipe.isFavorite {
//            favoriteActionTitle = "no Favorite"
//            favoriteActionStyle = UIAlertActionStyle.destructive
//        }
//        
//        let favoriteAction = UIAlertAction(title: favoriteActionTitle, style: favoriteActionStyle) { (action) in
//            let recipe = self.recipes[indexPath.row]
//            recipe.isFavorite = !recipe.isFavorite
//            DispatchQueue.main.async { [weak self] in
//                self?.tableView.reloadData()
//            }
//        }
//        alertController.addAction(buttonCancel)
//        alertController.addAction(favoriteAction)
//    
//        DispatchQueue.main.async { [weak self] in
//            self?.present(alertController, animated: true, completion: nil)
//        }
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            self.recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let shareAction = UITableViewRowAction(style: .default, title: "share") { (action, indexPath) in
            
            let sharedefaultText = "i like the recepie of \(self.recipes[indexPath.row].name)"
            
            let activityController = UIActivityViewController(activityItems: [sharedefaultText], applicationActivities: nil)
            
            DispatchQueue.main.async { [weak self] in
                self?.present(activityController, animated: true, completion: nil)
            }
        }
        shareAction.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "delete") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            DispatchQueue.main.async {
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        return [shareAction, deleteAction]
    }
 
  
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if segue.identifier == "showImageRecipe" {
            
            //optional binding
            if let IndexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[IndexPath.row]
                let destinationVC = segue.destination as! DetailVC
                destinationVC.recipe = selectedRecipe
            }
        }
        
     }
    
    
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */



}
