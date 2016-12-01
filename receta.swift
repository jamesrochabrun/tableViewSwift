//
//  receta.swift
//  recetas
//
//  Created by James Rochabrun on 11/30/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

import UIKit
import Foundation

class Recepie: NSObject {

    var name: String!
    var image: UIImage!
    var timecook: Int!
    var ingredients: [String]!
    var steps: [String]!
    //var isFavorite: Bool = false
    var rating: String = "close"
    
    
    init(name: String, image: UIImage, time: Int, ingredients:[String], steps:[String]) {
        self.name = name
        self.image = image
        self.timecook = time
        self.ingredients = ingredients
        self.steps = steps
    }
    
    
}
