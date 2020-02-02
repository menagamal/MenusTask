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
    
    func setDetails(meal:MealModel,completation:@escaping((_ image:UIImage)->Void)) {
        if meal.imageBase64 != nil {
            
            let dataDecoded : Data = Data(base64Encoded: meal.imageBase64!, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded)!
            self.mealImageView.image = decodedimage
            
        } else if let url = meal.photoUrl {
            mealImageView.sd_setImage(with: URL(string: url)!) { (img, err, typ, ur) in
                completation(img!)
            }
        }
        
        
        labelId.text = "#\(meal.id!)"
        labelName.text = meal.name
        
        mealImageView.hero.id = "foo"
        
        
    }
}
