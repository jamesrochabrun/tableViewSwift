//
//  DetailVC.swift
//  recetas
//
//  Created by James Rochabrun on 12/1/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var recpieImageView: UIImageView!
    var recipe: Recepie!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ratingbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        DispatchQueue.main.async { [weak self] in
            self?.recpieImageView.image = self?.recipe.image
            self?.title = self?.recipe.name
        }
        
        self.tableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        self.ratingbutton.setImage(UIImage(named: self.recipe.rating), for:.normal)
        
//        self.tableView.estimatedRowHeight = 44.0
//        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        
        if let reviewVC = segue.source as? ReviewViewController {
            
            if let rating = reviewVC.ratingSelected {
                print(rating)
                self.recipe.rating = rating
                self.ratingbutton.setImage(UIImage(named: self.recipe.rating), for:.normal)
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! RecipeDetailCell
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.keyLabel.text = "Nombre"
                cell.valueLabel.text = self.recipe.name
            case 1:
                cell.keyLabel.text = "tiempo"
                cell.valueLabel.text = "time: \(self.recipe.timecook)"
//            case 2:
//                cell.keyLabel.text = "favorita"
//                if self.recipe.isFavorite {
//                    cell.valueLabel.text = "si"
//                } else {
//                    cell.valueLabel.text = "no"
//                }
            default:
                break
            }
        case 1:
            if indexPath.row == 0 {
                cell.keyLabel.text = "Ingredients"
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
        case 2:
            if indexPath.row == 0 {
                cell.keyLabel.text = "steps"
            } else {
                cell.keyLabel.text = ""
            }
            cell.valueLabel.text = self.recipe.steps[indexPath.row]

        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var title =  ""
        switch section {
        case 1:
            title = "Ingredients"
        case 2:
            title = "Steps"
        default:
            break
        }
        return title
    }
}

extension DetailVC: UITableViewDelegate {
    
    
    
}








