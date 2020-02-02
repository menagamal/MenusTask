//
//  TagCollectionViewCell.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagImageView: UIImageView!
    @IBOutlet weak var labelTagName: UILabel!
    
    func setDetails(tag:TagModel,completation:@escaping((_ image:UIImage)->Void)) {
        if tag.imageBase64 != nil {
            
            let dataDecoded : Data = Data(base64Encoded: tag.imageBase64!, options: .ignoreUnknownCharacters)!
            let decodedimage:UIImage = UIImage(data: dataDecoded)!
            self.tagImageView.image = decodedimage
            
        } else if let url = tag.photoURL {
            tagImageView.sd_setImage(with: URL(string: url)!) { (img, err, typ, ur) in
                completation(img!)
            }
        }
        
        labelTagName.text = tag.tagName
    }
    
}
