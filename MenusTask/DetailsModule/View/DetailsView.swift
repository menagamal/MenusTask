//
//  DetailsView.swift
//  MenusTask
//
//  Created by Mena Gamal on 2/1/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import UIKit

protocol DetailsView:class {
    var labelDesc: UILabel! {
        get set
    }
    var labelName: UILabel! {
        get set
    }
    var labelId: UILabel! {
        get set
    }
    var mealImageView: UIImageView! {
        get set
    }
    func showError(errorStr:String)
}
