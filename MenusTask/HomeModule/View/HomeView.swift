//
//  HomeView.swift
//  MenusTask
//
//  Created by Mena Gamal on 1/31/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

protocol HomeView:class {
    func didLoadAllTags(tags:[TagModel])
    func didLoadAllMeals(meals:[MealModel])
    func showError(errorStr:String)
}
