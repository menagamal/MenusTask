//
//  UIImageView+Extentions.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
extension UIImageView{
  func setImageWithUrl(url: String){
    if let imageURL = URL(string: url){
      self.sd_setImage(with: imageURL, completed: nil)
      self.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "Icon feather-image"), options: .init(), completed: nil)
    
      self.sd_setShowActivityIndicatorView(true)
      self.sd_showActivityIndicatorView()
      
      if #available(iOS 13.0, *) {
        self.sd_setIndicatorStyle(.medium)
      } else {
        self.sd_setIndicatorStyle(.gray)
      }
    }
  }
    
    func mirrorImageView() {
        if let image = self.image {
            self.image = UIImage(cgImage: image.cgImage!, scale: image.scale , orientation: .upMirrored)
        }
    }
}
