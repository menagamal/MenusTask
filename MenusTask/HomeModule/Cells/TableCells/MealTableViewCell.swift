//
//  MealTableViewCell.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    func setDetails(meal:MealModel) {
        if let url = meal.photoUrl {
            mealImageView.setImageWithUrl(url: url)
        }
        
        labelId.text = "#\(meal.id!)"
        labelName.text = meal.name
    }
}
