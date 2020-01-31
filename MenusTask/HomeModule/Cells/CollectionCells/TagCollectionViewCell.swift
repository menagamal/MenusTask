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
    
    func setDetails(tag:TagModel) {
        if let url = tag.photoURL {
            tagImageView.setImageWithUrl(url: url)
        }
        
        labelTagName.text = tag.tagName
    }
    
}
