//
//  UIFont+Extentions.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
//SF Pro Display ["SFProDisplay-Regular", "SFProDisplay-Bold", "SFProDisplay-Semibold", "SFProDisplay-Medium"]
extension UIFont{
    //NAVIGATION
    @nonobjc class var NavigationTextFont:UIFont{
      return UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    @nonobjc class var NavigationLargetTitleTextFont:UIFont{
        return UIFont(name: "SFProDisplay-Bold", size: 35.0)!
    }
//TEXTFIELD
    @nonobjc class var TextFieldPlacehlder: UIFont {
        return UIFont(name: "SFProDisplay-Regular", size: 16.0)!
    }
    @nonobjc class var TextFieldText: UIFont {
        return UIFont(name: "SegoeUI", size: 16.0)!
    }
    @nonobjc class var TextFieldTextCode: UIFont {
        return UIFont(name: "SegoeUI-Bold", size: 16.0)!
    }
    @nonobjc class var TabBarItemFont: UIFont {
        return UIFont(name: "SFProDisplay-Medium", size: 10.0)!
    }
    //Button
    @nonobjc class var ButtonTextFont: UIFont {
        return UIFont(name: "SFProDisplay-Medium", size: 15.0)!
    }
    @nonobjc class var ButtonTextFontSecondry: UIFont {
        return UIFont(name: "SFProDisplay-Regular", size: 16.0)!
    }
    //TableView Section
    @nonobjc class var TableViewSection: UIFont {
        return UIFont(name: "SFProDisplay-Semibold", size: 16.0)!
    }
  
  // Segmented
  @nonobjc class var SegmentedFont:UIFont{
         return UIFont(name: "SFProDisplay-Bold", size: 14.0)!
     }

}
